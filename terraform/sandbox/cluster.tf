module "cluster" {
  source                 = "../modules/base"
  environment            = "sandbox"
  cluster_name           = "retreat-2026-deploy-sandbox"
  domain_name            = "sandbox.retreat2026.scaf.sixfeetup.com"
  api_domain_name        = "api.sandbox.retreat2026.scaf.sixfeetup.com"
  cluster_domain_name    = "k8s.sandbox.retreat2026.scaf.sixfeetup.com"
  argocd_domain_name     = "argocd.sandbox.retreat2026.scaf.sixfeetup.com"
  prometheus_domain_name = "prometheus.sandbox.retreat2026.scaf.sixfeetup.com"
  existing_hosted_zone   = module.global_variables.existing_hosted_zone
  control_plane = {
    # 2 vCPUs, 4 GiB RAM, $0.0376 per Hour
    instance_type = "t3a.medium"
    num_instances = 1
    disk_size     = 100  # Size in GB
    # NB!: set ami_id to prevent instance recreation when the latest ami
    # changes, eg:
    # ami_id = "ami-09d22b42af049d453"

  }

  # NB!: limit admin_allowed_ips to a set of trusted
  # public ip addresses. Both variables are comma separated lists of ips.
  # admin_allowed_ips = "10.0.0.1/32,10.0.0.2/32"
}
