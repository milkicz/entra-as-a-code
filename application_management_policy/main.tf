resource "msgraph_update_resource" "application_management_policy" {
  url = "policies/defaultAppManagementPolicy"

  body = {
    "isEnabled": true,
    "applicationRestrictions": {
        "passwordCredentials": [
            {
                "restrictionType": "passwordAddition",
                "state": "enabled",
                "maxLifetime": null,
                "restrictForAppsCreatedAfterDateTime": "2027-02-20T10:37:00Z"
            },
            {
                "restrictionType": "customPasswordAddition",
                "state": "enabled",
                "maxLifetime": null,
                "restrictForAppsCreatedAfterDateTime": "2027-05-20T10:37:00Z"
            },
            {
                "restrictionType": "symmetricKeyAddition",
                "state": "enabled",
                "maxLifetime": null,
                "restrictForAppsCreatedAfterDateTime": "2027-02-20T10:37:00Z"
            },
        ],
        "keyCredentials": [
            {
                "restrictionType": "asymmetricKeyLifetime",
                "state": "enabled",
                "maxLifetime": "P180D",
                "restrictForAppsCreatedAfterDateTime": "2025-02-20T10:37:00Z"
            }
        ]
    },
  }
}
