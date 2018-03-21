# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# Country.create(country_name:"Norway",country_code:"NO" )
# Country.create(country_name:"USA",country_code:"USA" )
# Country.create(country_name:"Nigeria",country_code:"NI" )
# Country.create(country_name:"New Zealand",country_code:"NZ" )
# Country.create(country_name:"Netherlands",country_code:"NET" )
# Country.create(country_name:"Nepal",country_code:"NE" )
# Country.create(country_name:"Namibia",country_code:"NA" )
# Country.create(country_name:"Myanmar",country_code:"MYN" )
# Country.create(country_name:"United Kingdom",country_code:"UK" )
# Country.create(country_name:"Montenegro",country_code:"MT" )
# Country.create(country_name:"Mongolia",country_code:"MO" )
# Country.create(country_name:"Mexico",country_code:"ME" )
# Country.create(country_name:"Mauritius",country_code:"MU" )
# Country.create(country_name:"Malta",country_code:"MA" )
# Country.create(country_name:"Maldives",country_code:"ML" )
# Country.create(country_name:"Malaysia",country_code:"MY" )
# Country.create(country_name:"Luxembourg",country_code:"LU" )
# Country.create(country_name:"Lithuania",country_code:"LI" )
# Country.create(country_name:"Libya",country_code:"LY" )
# Country.create(country_name:"Lebanon",country_code:"LE" )
# Country.create(country_name:"Latvia",country_code:"LT" )
# Country.create(country_name:"Laos",country_code:"LO" )
# Country.create(country_name:"Kuwait",country_code:"KW" )
# Country.create(country_name:"Korea(South)",country_code:"KS" )
# Country.create(country_name:"Korea(North)",country_code:"KN" )
# Country.create(country_name:"Kenya",country_code:"KEN" )
# Country.create(country_name:"Jordan",country_code:"JO" )
# Country.create(country_name:"Japan",country_code:"JA" )
# Country.create(country_name:"Jamaica",country_code:"JM" )
# Country.create(country_name:"Italy",country_code:"IY" )
# Country.create(country_name:"Israel",country_code:"IS" )
# Country.create(country_name:"Ireland",country_code:"IRE" )
# Country.create(country_name:"Iraq",country_code:"IQ" )
# Country.create(country_name:"Iran",country_code:"IR" )
# Country.create(country_name:"Indonesia",country_code:"IND" )
# Country.create(country_name:"India",country_code:"IN" )
# Country.create(country_name:"Iceland",country_code:"IL" )
# Country.create(country_name:"Hungary",country_code:"HU" )
# Country.create(country_name:"Hong Kong",country_code:"HK" )
# Country.create(country_name:"Guatemala",country_code:"GU" )
# Country.create(country_name:"Greece",country_code:"GE" )
# Country.create(country_name:"Ghana",country_code:"GH" )
# Country.create(country_name:"Germany",country_code:"GR" )
# Country.create(country_name:"Georgia",country_code:"GO" )
# Country.create(country_name:"France",country_code:"FR" )
# Country.create(country_name:"Finland",country_code:"FI" )
# Country.create(country_name:"Fiji",country_code:"FJ" )
# Country.create(country_name:"Ethiopia",country_code:"ET" )
# Country.create(country_name:"Estonia",country_code:"ES" )
# Country.create(country_name:"Egypt",country_code:"EY" )
# Country.create(country_name:"Ecuador",country_code:"EC" )
# Country.create(country_name:"Dominican Republic",country_code:"DR" )
# Country.create(country_name:"Denmark",country_code:"DN" )
# Country.create(country_name:"Czech Republic",country_code:"CZ" )
# Country.create(country_name:"Cyprus",country_code:"CY" )
# Country.create(country_name:"Cuba",country_code:"CU" )
# Country.create(country_name:"Croatia",country_code:"CRO" )
# Country.create(country_name:"Costa Rica",country_code:"CR" )
# Country.create(country_name:"Colombia",country_code:"CO" )
# Country.create(country_name:"China",country_code:"CH" )
# Country.create(country_name:"Chile",country_code:"CL" )
# Country.create(country_name:"Canada",country_code:"CN" )
# Country.create(country_name:"Cameroon",country_code:"CM" )
# Country.create(country_name:"Cambodia",country_code:"CA" )
# Country.create(country_name:"Bulgaria",country_code:"BU" )
# Country.create(country_name:"Brunei Darussalam",country_code:"BD" )
# Country.create(country_name:"Brazil",country_code:"BR" )
# Country.create(country_name:"Bosnia and Herzegovina",country_code:"BOHE" )

# Country.create(country_name:"Bolivia",country_code:"BO" )
# Country.create(country_name:"Bhutan",country_code:"BHU" )
# Country.create(country_name:"Bermuda",country_code:"BER" )
# Country.create(country_name:"Belgium",country_code:"BL" )
# Country.create(country_name:"Belarus",country_code:"BE" )
# Country.create(country_name:"Barbados",country_code:"BAR" )
# Country.create(country_name:"Bangladesh",country_code:"BA" )
# Country.create(country_name:"Bahrain",country_code:"BH" )
# Country.create(country_name:"Azerbaijan",country_code:"AZ" )
# Country.create(country_name:"Austria",country_code:"AU" )
# Country.create(country_name:"Australia",country_code:"AUS" )
# Country.create(country_name:"Argentina",country_code:"AR" )
# Country.create(country_name:"Angola",country_code:"AN" )
# Country.create(country_name:"Algeria",country_code:"AL" )
# Country.create(country_name: "Afghanistan",country_code: "AF")

# # for institution Admin User:
# InstitutionAdminUserAccount.create(role:"Primary Institutiton Administrator", publisher_id: "1",institution_name: "Adept Techno Demo", user_name: "PA01", status: "active",first_name: "test1", last_name: "test2",email: "test@gmail.com", phone: 9876543210, fax: "1234",password: "12345",comments: "test user", primary_count: 1)
# User.create(email: "ctssuperadmin@bookstoredev.com",password: "adi@1234", admin: "false")

#InstitutionAccount.where(id: 58).last.update_attributes(end_user_id: 2)
#InstitutionAccount.where(id: 58).last.ip_addresses.last.update_attributes(low_ip: "999323992")


SubjectGroup.create!(publisher_id: 10, subject_group_level: 2, subject_group_code: "BP", subject_group_name: "Botany, Plant Science and Agriculture", language: "ENG", subject_group_description: "test", subject_id: "66",member_publisher_id: "" )
SubjectGroup.create!(publisher_id: 10, subject_group_level: 2, subject_group_code: "BS", subject_group_name: "Biological Science, Biochemistry, Genetics, Biotechnology, Molecular Biology, Microbiology and Immunology", language: "ENG", subject_group_description: "test", subject_id: "67",member_publisher_id: "" )
SubjectGroup.create!(publisher_id: 10, subject_group_level: 2, subject_group_code: "GG", subject_group_name: "Geography and Geology", language: "ENG", subject_group_description: "test", subject_id: "68",member_publisher_id: "" )
SubjectGroup.create!(publisher_id: 10, subject_group_level: 2, subject_group_code: "PA", subject_group_name: "Physics and Astrophysics", language: "ENG", subject_group_description: "test", subject_id: "69",member_publisher_id: "" )
SubjectGroup.create!(publisher_id: 10, subject_group_level: 2, subject_group_code: "CS", subject_group_name: "Computer Science & Information Technology", language: "ENG", subject_group_description: "test", subject_id: "70",member_publisher_id: "" )
SubjectGroup.create!(publisher_id: 10, subject_group_level: 2, subject_group_code: "CSI", subject_group_name: "Computer Science & Information TechnologyElectronics and Communication & Electrical Engineering", language: "ENG", subject_group_description: "test", subject_id: "71",member_publisher_id: "" )
SubjectGroup.create!(publisher_id: 10, subject_group_level: 2, subject_group_code: "PR", subject_group_name: "Philosophy and Religion", language: "ENG", subject_group_description: "test", subject_id: "72",member_publisher_id: "" )
SubjectGroup.create!(publisher_id: 10, subject_group_level: 2, subject_group_code: "HA", subject_group_name: "History, Architecture and Archaeology", language: "ENG", subject_group_description: "test", subject_id: "73",member_publisher_id: "" )
SubjectGroup.create!(publisher_id: 10, subject_group_level: 2, subject_group_code: "JM", subject_group_name: "Journalism and Mass Communication", language: "ENG", subject_group_description: "test", subject_id: "74",member_publisher_id: "" )
SubjectGroup.create!(publisher_id: 10, subject_group_level: 2, subject_group_code: "ZA", subject_group_name: "Zoology, Animal Science & Veterinary Science", language: "ENG", subject_group_description: "test", subject_id: "75",member_publisher_id: "" )






















