locals {
  region_abbreviations = {
    north     = "n"
    south     = "s"
    east      = "e"
    west      = "w"
    central   = "c"
    northeast = "ne"
    northwest = "nw"
    southeast = "se"
    southwest = "sw"
    gov       = "g"
    iso       = "i"
    isob      = "ib"
    isoe      = "ie"
    isof      = "if"
  }

  # "us-east-1" -> "use1", "ap-southeast-4" -> "apse4", "us-gov-west-1" -> "usgw1"
  region_short = lower(join("", [
    for i, part in split("-", var.region) :
    i == 0 ? part : lookup(local.region_abbreviations, part, part)
  ]))

  # "us-east-1" -> "useast1", "ap-southeast-4" -> "apsoutheast4", "us-gov-west-1" -> "usgovwest1"
  region_compact = join("", split("-", var.region))

  regional_prefix = var.environment
  global_prefix   = "${var.environment}-${local.region_short}"

  tags = {
    Project     = var.project_name
    Region      = var.region
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "SRE Team"
  }
}
