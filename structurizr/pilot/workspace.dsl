workspace {

    model {
        // People
        participant = person "Participant User" "A member of the public who is eligible for lung cancer risk check" "Participant"
        st = person "Lung Cancer Screening Provider Staff users" "Internal staff users including clinical and administrative staff" "Lung Cancer Screening Provider Staff"

        // Dummy "neutral" system to use as diagram scope
        overview = softwareSystem "LHC Overview" {
            description "Logical overview to include all relevant systems"
        }

        // Real systems
        gpSystem = softwareSystem "GP System" "Holds primary care data for patients" "External System"

        localCohortingSystem = softwareSystem "Local Cohorting System" "Extracts primary care data from GP systems and identifies initial eligible cohort" "External System"

        localPreAssessmentSystem = softwareSystem "Local LHC Preassessment System" "Processes data from GP system to identify at-risk individuals, manage invitations, support lung cancer risk check, CT appointment booking & referral" "External System"

        localNotificationSystem = softwareSystem "Local Notification System" "Delivers communications (letters only) to participants" "External System"

        // Connect the overview system to all others (dummy relationships just to make them appear)
        // overview -> gpSystem "Includes"
        // overview -> localPreAssessmentSystem "Includes"
       // overview -> localNotificationSystem "Includes"
       // overview -> participant "Includes"

        // Real relationships
        gpSystem -> localCohortingSystem "Provides GP patient record data to"
        localCohortingSystem -> localPreAssessmentSystem "Provides lung screening initial eligible cohort data (LUNGDF100) to"
        localPreAssessmentSystem -> localNotificationSystem "Sends communications using"
        localNotificationSystem -> participant "Sends communications to"
        selection = localPreAssessmentSystem -> participant "Selects for invitation based on risk" 
        rawGpData = gpSystem -> localPreAssessmentSystem "Provides raw data to"
        st -> localPreAssessmentSystem "Uses to manage telephone lung cancer risk check, CT appointment booking & referral process"
        st -> participant "Runs telephone lung risk check journey with (questions answered, risk rating provided, CT scan appointment booked)" 
    }

    views {
        systemContext localPreAssessmentSystem {
            include *
            exclude selection
            exclude rawGpData
            autolayout lr
            title "Lung Cancer Risk Check System Context – Full View (Pilot state)"
            description "All systems and user interactions involved in Lung Cancer Risk Check stage of Lung Cancer Screening (Pilot)"
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
            element "Lung Cancer Screening Provider Staff" {
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
