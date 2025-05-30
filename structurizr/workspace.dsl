workspace "Name" "Description" {

    !identifiers hierarchical

    model {
        u = person "P9 Participant users" "External user eligible for screening" "Participant"
        st = person "Staff users" "Internal staff users including clinical and administrative staff" "NHS Staff"
        ss = softwareSystem "Software System" {
            wa = container "Web Application"
            db = container "Database Schema" {
                tags "Database"
            }
        }

        st -> ss.wa "Uses"
        ss.wa -> ss.db "Reads from and writes to"
    }

    views {
        systemContext ss "Diagram1" {
            include *
            autolayout lr
        }

        container ss "Diagram2" {
            include *
            autolayout lr
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

    configuration {
        scope softwaresystem
    }

}