#Her skal locals legges inn - det er de variablene som gjelder for en spesifikk feks lokasjon eller en bedrift. 
# locals skal være for lokale 
locals {
  common_tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
  }
}
