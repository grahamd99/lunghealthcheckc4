workspace {

    model {
        // People
        participant = person "Participant User" {
            description "A member of the public who may be eligible for lung health checks"
        }
        st = person "Staff users" "Internal staff users including clinical and administrative staff" "NHS Staff"

        // Dummy "neutral" system to use as diagram scope
        overview = softwareSystem "LHC Overview" {
            description "Logical overview to include all relevant systems"
        }

        // Real systems
        gpSystem = softwareSystem "GP System" {
            description "Holds primary care data for patients"
        }

        localCohortingSystem = softwareSystem "Local Cohorting System" {
            description "Extracts primary care data from GP systems and identifies initial eligible cohort"
        }

        localPreAssessmentSystem = softwareSystem "Local LHC Preassessment System" {
            description "Processes data from GP system to identify at-risk individuals, manage invitations and support pre-assessment"
        }

        localNotificationSystem = softwareSystem "Local Notification System" {
            description "Delivers communications (letters only) to patients"
        }

        // Connect the overview system to all others (dummy relationships just to make them appear)
        // overview -> gpSystem "Includes"
        // overview -> localPreAssessmentSystem "Includes"
       // overview -> localNotificationSystem "Includes"
       // overview -> participant "Includes"

        // Real relationships
        gpSystem -> localCohortingSystem "Extracts data from"
        localCohortingSystem -> localPreAssessmentSystem "Provides initial eligible cohort to"
        localPreAssessmentSystem -> localNotificationSystem "Sends communications using"
        localNotificationSystem -> participant "Sends communications to"
        selection = localPreAssessmentSystem -> participant "Selects for invitation based on risk" 
        rawGpData = gpSystem -> localPreAssessmentSystem "Provides raw data to"
        st -> localPreAssessmentSystem "Uses to manage pre-assessment & referral process"
        st -> participant "Asks pre-assessment questions to"
    }

    views {
        systemContext localPreAssessmentSystem {
            include *
            exclude selection
            exclude rawGpData
            autolayout lr
            title "Local LHC Preassessment System Context – Full View"
            description "All systems and user interactions involved in Targeted Lung Health Check"
        }

        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Participant" {
                background #686868
            }
            element "NHS Staff" {
                background #08427B
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "External System" {
                background #686868
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Database" {
                shape Cylinder
            }
            element "Queue" {
                shape "Pipe"
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
          }
    }
}
