run "validate" {
  command = apply
  module {
    source = "../examples/create-dataworks-project-basic"
  }
  variables {
    project_name = "tfdws"
  }
  assert {
    condition     = output.project_id != ""
    error_message = "DataWorks project creation failed"
  }
  assert {
    condition     = output.project_name == "tfdws"
    error_message = "Project name should match the input"
  }
}
