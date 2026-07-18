# providers.tf
provider "oci" {
  tenancy_ocid     = "ocid1.tenancy.oc1..xxxxx" # Cámbialo por el tuyo
  user_ocid        = "ocid1.user.oc1..xxxxx"    # Cámbialo por el tuyo
  fingerprint      = "xx:xx:xx..."              # La obtienes al subir tu API Key
  private_key_path = "~/.oci/oci_api_key.pem"   # Ruta a tu clave privada
  region           = "us-ashburn-1"             # O la que elijas al crear la cuenta
}