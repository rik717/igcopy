// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationDispense_Injection
Parent: JP_MedicationDispenseBase
Id: JP-MedicationDispense-Injection
Title: "JP_MedicationDispense_Injection"
Description: "このプロファイルはMedicationDispenseリソースに対して、注射薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。JP_MedicationDispenseBaseプロファイルからの派生プロファイルである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense_Injection"
* ^date = "2021-12-25T14:35:21.0508205Z"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "このプロファイルはMedicationDispenseリソースに対して、注射薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。JP_MedicationDispenseBaseプロファイルからの派生プロファイルである。"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* dosageInstruction.extension[UsageDuration] 0..0
* dosageInstruction.extension[PeriodOfUse] 0..0