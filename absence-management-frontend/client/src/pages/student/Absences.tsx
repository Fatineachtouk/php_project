import { useState } from 'react';
import { DashboardLayout } from '@/components/DashboardLayout';
import { ProtectedRoute } from '@/components/ProtectedRoute';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { QRScanner } from '@/components/QRScanner';
import { useAuth } from '@/contexts/AuthContext';
import { presenceAPI } from '@/lib/api';
import { QrCode, CheckCircle2, XCircle, Loader2, History } from 'lucide-react';
import { toast } from 'sonner';

export default function StudentAbsences() {
  const { user } = useAuth();
  const [isScanning, setIsScanning] = useState(false);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [lastResult, setLastResult] = useState<{ success: boolean; message: string } | null>(null);

  const handleScanSuccess = async (decodedText: string) => {
    setIsScanning(false);
    setIsSubmitting(true);
    
    try {
      // Parse the QR code data
      const qrData = JSON.parse(decodedText);
      
      if (!qrData.seance_id || !qrData.code_qr) {
        throw new Error("Format de code QR invalide");
      }

      const response: any = await presenceAPI.markPresence({
        seance_id: qrData.seance_id,
        etudiant_id: user!.id,
        code_qr_scanne: qrData.code_qr
      });

      setLastResult({
        success: true,
        message: response.message || "Présence enregistrée avec succès !"
      });
      toast.success("Présence validée !");
    } catch (error: any) {
      console.error('Error marking presence:', error);
      setLastResult({
        success: false,
        message: error.message || "Échec de la validation de présence"
      });
      toast.error(error.message || "Erreur lors du scan");
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <ProtectedRoute allowedRoles={['etudiant']}>
      <DashboardLayout
        title="Mes Présences & Absences"
        description="Scannez le code QR en classe pour marquer votre présence"
      >
        <div className="grid gap-6 md:grid-cols-2">
          <Card className="overflow-hidden">
            <CardHeader className="bg-primary/5">
              <CardTitle className="flex items-center gap-2">
                <QrCode className="h-5 w-5" />
                Scanner un Code QR
              </CardTitle>
              <CardDescription>
                Utilisez votre caméra pour scanner le code affiché par le professeur
              </CardDescription>
            </CardHeader>
            <CardContent className="p-6 flex flex-col items-center justify-center min-h-[300px]">
              {isSubmitting ? (
                <div className="text-center space-y-4">
                  <Loader2 className="h-12 w-12 animate-spin mx-auto text-primary" />
                  <p className="text-muted-foreground">Validation de votre présence...</p>
                </div>
              ) : isScanning ? (
                <div className="w-full space-y-4">
                  <QRScanner onScanSuccess={handleScanSuccess} />
                  <Button 
                    variant="outline" 
                    className="w-full" 
                    onClick={() => setIsScanning(false)}
                  >
                    Annuler
                  </Button>
                </div>
              ) : lastResult ? (
                <div className="text-center space-y-6">
                  {lastResult.success ? (
                    <CheckCircle2 className="h-16 w-16 text-green-500 mx-auto" />
                  ) : (
                    <XCircle className="h-16 w-16 text-destructive mx-auto" />
                  )}
                  <div>
                    <h3 className="text-xl font-bold">{lastResult.success ? "Succès !" : "Erreur"}</h3>
                    <p className="text-muted-foreground">{lastResult.message}</p>
                  </div>
                  <Button onClick={() => { setLastResult(null); setIsScanning(true); }}>
                    Scanner à nouveau
                  </Button>
                </div>
              ) : (
                <div className="text-center space-y-6">
                  <div className="bg-primary/10 p-6 rounded-full inline-block">
                    <QrCode className="h-12 w-12 text-primary" />
                  </div>
                  <p className="text-muted-foreground max-w-[250px] mx-auto">
                    Prêt à marquer votre présence ? Cliquez sur le bouton ci-dessous pour ouvrir la caméra.
                  </p>
                  <Button size="lg" className="w-full" onClick={() => setIsScanning(true)}>
                    Ouvrir le Scanner
                  </Button>
                </div>
              )}
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <History className="h-5 w-5" />
                Statistiques de Présence
              </CardTitle>
              <CardDescription>
                Aperçu de votre assiduité
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-2 gap-4">
                <div className="p-4 rounded-lg bg-green-50 border border-green-100 text-center">
                  <p className="text-sm text-green-600 font-medium">Présences</p>
                  <p className="text-3xl font-bold text-green-700">--</p>
                </div>
                <div className="p-4 rounded-lg bg-red-50 border border-red-100 text-center">
                  <p className="text-sm text-red-600 font-medium">Absences</p>
                  <p className="text-3xl font-bold text-red-700">--</p>
                </div>
              </div>
              <div className="mt-6 p-8 text-center border rounded-lg border-dashed">
                <p className="text-muted-foreground text-sm">L'historique détaillé sera bientôt disponible</p>
              </div>
            </CardContent>
          </Card>
        </div>
      </DashboardLayout>
    </ProtectedRoute>
  );
}