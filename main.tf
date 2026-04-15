data "octopusdeploy_lifecycles" "all" {
  take = 1000
}

data "octopusdeploy_library_variable_sets" "all" {
  take = 1000
}

locals {
  lifecycle_ids = {
    for lc in data.octopusdeploy_lifecycles.all.lifecycles :
    lc.name => lc.id
  }

  variable_set_ids = {
    for vs in data.octopusdeploy_library_variable_sets.all.library_variable_sets :
    vs.name => vs.id
  }
}

resource "octopusdeploy_project_group" "this" {
  name = var.project_group_name
}



resource "octopusdeploy_git_credential" "app"{
    name = "Git credential"
    password = var.git_password
    username = var.git_username
}

resource "octopusdeploy_project" "app" {
  name                                 = "Version-Controlled Project"
  project_group_id                     = octopusdeploy_project_group.this.id
  lifecycle_id                         =  local.lifecycle_ids[var.lifecycle_name]
  is_version_controlled = true
  git_library_persistence_settings {
    git_credential_id = octopusdeploy_git_credential.app.id
    url =               "<git-url>"
    default_branch      = "main"
    base_path           = ".octopus"
    protected_branches  = []
  }
}

# resource "octopusdeploy_project" "this" {
#   name             = var.project_name
#   description      = var.project_description
#   project_group_id = octopusdeploy_project_group.this.id

#   lifecycle_id = local.lifecycle_ids[var.lifecycle_name]

#   included_library_variable_sets = sort([
#     for name in var.variable_set_names :
#     local.variable_set_ids[name]
#   ])
# }