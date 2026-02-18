# 7️⃣ Null Block (null_resource)
# 🔹 What is it?

# Used to run scripts or commands.

# It does not create Azure resource.

# ✅ Example: Run Local Script
# resource "null_resource" "example" {
#   provisioner "local-exec" {
#     command = "echo Hello Azure DevOps"
#   }
# }

# Used in real projects:

# Run az cli commands

# Trigger pipeline

# Configure something after VM creation