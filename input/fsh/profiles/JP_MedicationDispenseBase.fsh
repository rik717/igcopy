// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationDispenseBase
Parent: MedicationDispense
Id: JP-MedicationDispenseBase
Title: "JP_MedicationDispenseBase"
Description: "このプロファイルはユーザは直接適用するものではなく、JP_MedicationDispenseとJP_MedicationDispenseInjectionの共通の親となる抽象プロファイルである。このプロファイルはMedicationDispenseリソースに対して、内服・外用薬剤処方調剤・払い出し記録のデータを送受信するため、JP_MedicationDispenseとJP_MedicationDispenseInjectionの各プロファイルの基礎となる制約と拡張のうち共通部分を定めている。"
// extension 参照宣言 基底拡張2個、内部拡張1個
* extension contains JP_MedicationDispense_Preparation named Preparation 0..*
* dosageInstruction.extension contains
    JP_MedicationRequest_DosageInstruction_UsageDuration named UsageDuration 0..1 and
    JP_MedicationRequest_DosageInstruction_PeriodOfUse named PeriodOfUse 0..1 and
    JP_MedicationRequest_DosageInstruction_Line named Line 0..* and
    JP_MedicationRequest_DosageInstruction_Device named Device 0..*
//
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispenseBase"
* ^status = #draft
* ^date = "2022-03-16"
* ^purpose = "このプロファイルはユーザは直接適用するものではなく、JP_MedicationDispenseとJP_MedicationDispenseInjectionの共通の親となる抽象プロファイルである。このプロファイルはMedicationDispenseリソースに対して、内服・外用薬剤処方調剤・払い出し記録のデータを送受信するため、JP_MedicationDispenseとJP_MedicationDispenseInjectionの各プロファイルの基礎となる制約と拡張のうち共通部分を定めている。"
* . ^short = "指定された患者への薬剤の払い出し"
* . ^definition = "指定された患者・個人へ薬剤が払い出されたか払い出される予定のものを示す。これには（供給される）提供される製品についての説明や薬剤の服用に関する指示も含まれる。薬剤払い出しは薬剤オーダーに対して薬局システムが対応した結果となる。"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension[Preparation] ^short = "調剤結果"
* extension[Preparation] ^definition = "薬剤単位の調剤結果"
* extension[Preparation] ^min = 0
* partOf ^short = "Event that dispense is part of 親イベントへの参照"
* partOf ^definition = "The procedure that trigger the dispense. \r\n\r\nこの調剤の契機となったProcedureリソースへの参照。"
* status ^short = "preparation | in-progress | cancelled | on-hold | completed | entered-in-error | stopped | unknown"
* status ^definition = "A code specifying the state of the set of dispense events.\r\n\r\n\r\n一連の調剤イベントの状態を指定するコード。"
* statusReason[x] ^short = "Why a dispense was not performed　調剤が実行されなかった理由"
* statusReason[x] ^definition = "Indicates the reason why a dispense was not performed.\r\n\r\n調剤が実行されなかった理由を示します。"
* category ^short = "Type of medication dispense　調剤タイプ"
* category ^definition = "Indicates the type of medication dispense (for example, where the medication is expected to be consumed or administered (i.e. inpatient or outpatient)).\r\n\r\n投薬のタイプを示します（たとえば、薬剤が消費または投与されると予想される場所（つまり、入院患者または外来患者））。　入院、外来、退院、自宅など。"
* medication[x] only CodeableConcept
* medication[x] ^short = "What medication was supplied　医薬品"
* medication[x] ^definition = "Identifies the medication that was administered. This is either a link to a resource representing the details of the medication or a simple attribute carrying a code that identifies the medication from a known list of medications.\r\n\r\n投与された薬剤を識別する。既知の薬のリストから薬を識別するコード情報を設定する。"
* medication[x] ^comment = "If only a code is specified, then it needs to be a code for a specific product. If more information is required, then the use of the medication resource is recommended.  For example, if you require form or lot number, then you must reference the Medication resource.\r\n\r\n【JP-CORE】\r\nひとつのtext要素と、複数のcoding 要素を記述できる。処方オーダ時に選択または入力し、実際に処方箋に印字される文字列を必ずtext要素に格納した上で、それをコード化した情報を1個以上のcoding 要素に記述する。\r\n\r\n厚生労働省標準であるHOT9コード（販社指定が不要な場合にはHOT7コード）または広く流通しているYJコードを用いるか、一般名処方の場合には厚生労働省保険局一般名処方マスタのコードを使用して、Coding要素（コードsystemを識別するURI、医薬品のコード、そのコード表における医薬品の名称の3つからなる）で記述する。\r\n\rなお、上記のいずれの標準的コードも付番されていない医薬品や医療材料の場合には、薬機法の下で使用されているGS1標準の識別コードであるGTIN(Global Trade Item Number)の調剤包装単位（最少包装単位、個別包装単位）14桁を使用する。\r\n\rひとつの処方薬、医療材料を複数のコード体系のコードで記述してもよく、その場合にcoding 要素を繰り返して記述する。\rただし、ひとつの処方薬を複数のコードで繰り返し記述する場合には、それらのコードが指し示す処方薬、医療材料は当然同一でなければならない。\rまた、処方を発行した医療機関内でのデータ利用のために、医療機関固有コード体系によるコード（ハウスコード、ローカルコード）の記述を含めてもよいが、その場合でも上述したいずれかの標準コードを同時に記述することが必要である。"
* medication[x].id ^short = "Unique id for inter-element referencing 要素間参照用の一意のID"
* medication[x].id ^definition = "Unique id for the element within a resource (for internal references). This may be any string value that does not contain spaces.\r\n\r\nリソース内の要素の一意のID（内部参照用）。これは、スペースを含まない任意の文字列値にすることができる。"
* medication[x].coding 1..
* medication[x].coding ^short = "Code defined by a terminology system コード集で定義された医薬品コード"
* medication[x].coding ^definition = "A reference to a code defined by a terminology system.\r\n\r\nコード集で定義された医薬品コードへの情報"
* medication[x].coding ^comment = "Codes may be defined very casually in enumerations, or code lists, up to very formal definitions such as SNOMED CT - see the HL7 v3 Core Principles for more information.  Ordering of codings is undefined and SHALL NOT be used to infer meaning. Generally, at most only one of the coding values will be labeled as UserSelected = true.\r\n【JP-CORE】"
* medication[x].coding.system 1..
* medication[x].coding.code 1..
* medication[x].coding.display 1..
* subject only Reference(JP_Patient)
* subject ^short = "Who received medication　投与対象患者"
* subject ^definition = "The person or animal or group receiving the medication.\r\n\r\n投与を受ける患者"
* subject ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* context ^short = "Encounter / Episode associated with event　調剤ベントに関連するエンカウンターやエピソード"
* context ^definition = "The encounter or episode of care that establishes the context for this event.\r\n\r\n調剤ベントに関連するエンカウンターやエピソードへの参照。"
* context ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* supportingInformation ^short = "Information that supports the dispensing of the medication　薬の調剤をサポートする情報"
* supportingInformation ^definition = "Additional information that supports the medication being dispensed.\r\n\r\n調剤される薬剤をサポートする追加情報への任意のリソースへの参照。"
* supportingInformation ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* performer ^short = "Who performed event　調剤を実施した人"
* performer ^definition = "Indicates who or what performed the event.\r\n調剤した人を示す"
* location ^short = "Where the dispense occurred　調剤実施場所"
* location ^definition = "The principal physical location where the dispense was performed. \r\n\r\n調剤が実施された場所を示すLocationリソースへの参照。"
* location ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* authorizingPrescription ^short = "Medication order that authorizes the dispense　調剤を正当化する元の処方オーダ"
* authorizingPrescription ^definition = "Indicates the medication order that is being dispensed against.\r\n調剤の元になった処方オーダを表すMedicationRequestリソースへの参照。"
* type ^definition = "Indicates the type of dispensing event that is performed. For example, Trial Fill, Completion of Trial, Partial Fill, Emergency Fill, Samples, etc.\r\n実行される調剤イベントのタイプを示します。たとえば、トライアルフィル、トライアルの完了、部分フィル、緊急フィル、サンプルなどです。"
* type ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\nすべてのターミノロジーの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係とpre-coordinationとpost-coordinationの用語関係を管理するための独自の構造を提供する必要がある。"
* quantity 1..
* quantity ^short = "払い出される薬剤の量"
* quantity ^definition = "調剤総量。\r\nJP Coreでは必須\r\n払い出される薬剤の量。計測単位を含む。"
* quantity ^comment = "The context of use may frequently define what kind of quantity this is and therefore what kind of units can be used. The context of use may also restrict the values for the comparator.\r\n\r\n使用状況によって、これがどのような量であるか、したがってどのような単位を使用できるかが定義される場合がかなりあります。使用状況によっては、比較演算子の値も制限される場合がある。"
* quantity.value 1..
* quantity.unit 1..
* quantity.system 1..
* quantity.code 1..
* quantity.code ^short = "単位についてのコード形式"
* daysSupply ^short = "Amount of medication expressed as a timing amount　　タイミングとして表される投薬量"
* daysSupply ^definition = "The amount of medication expressed as a timing amount.\r\n\r\nタイミングとして表される投薬量。すなわち、XX日分、XX回分などの数量。"
* daysSupply ^comment = "The context of use may frequently define what kind of quantity this is and therefore what kind of units can be used. The context of use may also restrict the values for the comparator.\r\n\r\n使用状況によって、これがどのような量であるか、したがってどのような単位を使用できるかが定義される場合がかなりあります。使用状況によっては、比較演算子の値も制限される場合がある。"
* whenPrepared ^short = "When product was packaged and reviewed　調剤がパッケージ化され、レビューされた日時"
* whenPrepared ^definition = "The time when the dispensed product was packaged and reviewed.\r\n\r\n調剤がパッケージ化され、レビューされた日時"
* whenHandedOver 1..
* whenHandedOver ^short = "Medication order that authorizes the dispense　払い出された日時"
* whenHandedOver ^definition = "The time the dispensed product was provided to the patient or their representative.\r\n\r\n【JP Core】\r\n必須。\r\n患者あるいはその代理人に払い出される薬剤が提供された日時。"
* destination ^short = "Where the medication was sent　薬が送られた場所"
* destination ^definition = "Identification of the facility/location where the medication was shipped to, as part of the dispense event.\r\n\r\n調剤イベントの一環として、薬剤が出荷された行先先の施設/場所のLocarionリソースへの参照。"
* destination ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* receiver ^short = "Who collected the medication　 薬を受け取った人"
* receiver ^definition = "Identifies the person who picked up the medication.  This will usually be a patient or their caregiver, but some cases exist where it can be a healthcare professional.\r\n\r\n薬を受け取った人を識別する。これは通常、患者またはその介護者だが、医療専門家になる場合もある。"
* receiver ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* note ^short = "Information about the dispense　調剤に関する備考"
* note ^definition = "Extra information about the dispense that could not be conveyed in the other attributes.\r\n\r\n他の要素では伝達できなかった調剤に関する追加情報。"
* note ^comment = "For systems that do not have structured annotations, they can simply communicate a single annotation with no author or time.  This element may need to be included in narrative because of the potential for modifying information.  *Annotations SHOULD NOT* be used to communicate \"modifying\" information that could be computable. (This is a SHOULD because enforcing user behavior is nearly impossible).\r\n\r\n構造化された注釈（アノテーション）を持たないシステムの場合、作成者や時間なしで単一の注釈を簡単に伝達できる。情報を変更する可能性があるため、この要素をナラティブに含める必要がある場合があります。 \r\n*注釈は、計算機処理れきる「変更」情報を伝達するために使用されるべきではない*。 （ユーザーの行動を強制することはほとんど不可能であるため、これはSHOULDです）。"
* dosageInstruction ^short = "How the medication is to be used by the patient or administered by the caregiver　薬が患者によってどのように使用されるか、または介護者によってどのように投与されるか"
* dosageInstruction ^definition = "Indicates how the medication is to be used by the patient.\r\n\r\n薬が患者によってどのように使用されるか、または介護者によってどのように投与されるか。"
* dosageInstruction ^comment = "When the dose or rate is intended to change over the entire administration period (e.g. Tapering dose prescriptions), multiple instances of dosage instructions will need to be supplied to convey the different doses/rates.\rThe pharmacist reviews the medication order prior to dispense and updates the dosageInstruction based on the actual product being dispensed.\r\n\r\n投与量または投与量が投与期間全体にわたって変更されることを意図している場合（例えば、漸減投与量処方）、異なる投与量/投与量を伝えるために投与指示の複数のインスタンスを提供する必要があります。\r\n薬剤師は、調剤する前に投薬順序を確認し、調剤される実際の製品に基づいて投薬指示を更新します。"
* dosageInstruction.id ^short = "Unique id for inter-element referencing　要素間参照用の一意のID"
* dosageInstruction.id ^definition = "Unique id for the element within a resource (for internal references). This may be any string value that does not contain spaces.\r\n\r\nリソース内の要素の一意のID（内部参照用）。これは、スペースを含まない任意の文字列値にすることができる。"
* dosageInstruction.extension ^slicing.discriminator.type = #value
* dosageInstruction.extension ^slicing.discriminator.path = "url"
* dosageInstruction.extension ^slicing.rules = #open
* dosageInstruction.extension ^min = 0
* dosageInstruction.extension[UsageDuration] ^short = "実服用日数"
* dosageInstruction.extension[UsageDuration] ^definition = "実服用日数を格納する拡張。\r\n実服用日数（実投与日数）とは、投与期間において実際に服用（投与）が行われる実日数であり、休薬日を含まない。\r\n全期間が７日で、用法が隔日投与の場合には、１日目、３日目、５日目、７日目の４日間に服用することになるので、実服用日数は４日となる。"
* dosageInstruction.extension[PeriodOfUse] ^short = "投与期間"
* dosageInstruction.extension[PeriodOfUse] ^definition = "投与期間を明示的に記述する拡張。\r\nこの拡張を使用する場合には、開始日は必須。"
* dosageInstruction.extension[Device] only JP_MedicationRequest_DosageInstruction_Device
* dosageInstruction.extension[Device] ^sliceName = "Device"
* dosageInstruction.extension[Device] ^short = "投与機器の情報"
* dosageInstruction.extension[Device] ^definition = "投与機器の情報を記述する拡張。"
* dosageInstruction.extension[Device] ^min = 0
* dosageInstruction.extension[Line] only JP_MedicationRequest_DosageInstruction_Line
* dosageInstruction.extension[Line] ^sliceName = "Line"
* dosageInstruction.extension[Line] ^short = "投与ラインの情報"
* dosageInstruction.extension[Line] ^definition = "投与ラインの情報を記述する拡張。"
* dosageInstruction.extension[Line] ^min = 0
* dosageInstruction.sequence ^short = "The order of the dosage instructions　投与量の指示の順序"
* dosageInstruction.sequence ^definition = "Indicates the order in which the dosage instructions should be applied or interpreted.\r\n\r\n投与量の指示が適用または解釈されるべき順序を示す。"
* dosageInstruction.sequence ^requirements = "If the sequence number of multiple Dosages is the same, then it is implied that the instructions are to be treated as concurrent.  If the sequence number is different, then the Dosages are intended to be sequential.\r\n\r\n複数の投与量のシーケンス番号が同じである場合、命令は同時として扱われることを意味する。シーケンス番号が異なる場合、投与量は連続するように意図されています。"
* dosageInstruction.text 1..
* dosageInstruction.text ^short = "Free text dosage instructions e.g. SIG　  フリーテキストの投与方法の説明　SIG:用法"
* dosageInstruction.text ^definition = "Free text dosage instructions e.g. SIG.　フリーテキストの投与方法の説明　SIG:用法\r\n\r\n【JP-CORE】\r\nフリーテキストの用法指示であり、JP Coreでは必須である。"
* dosageInstruction.text ^requirements = "Free text dosage instructions can be used for cases where the instructions are too complex to code.  The content of this attribute does not include the name or description of the medication. When coded instructions are present, the free text instructions may still be present for display to humans taking or administering the medication. It is expected that the text instructions will always be populated.  If the dosage.timing attribute is also populated, then the dosage.text should reflect the same information as the timing.  Additional information about administration or preparation of the medication should be included as text.\r\n\r\n指示が複雑すぎてコーディングできない場合は、フリーテキストの投与指示を使用できる。この属性の内容には、薬の名前や説明は含まれない。コード化された指示が存在する場合、フリーテキストの指示は、薬を服用または投与している人間に表示するために存在している場合がある。テキストの指示は常に入力されることが期待されます。 dose.timing属性も同時に入力されている場合、dudgement.textはタイミングと同じ情報を反映している必要があり、薬の投与または準備に関する追加情報をテキストとして含める必要がある。"
* dosageInstruction.additionalInstruction ^short = "Supplemental instruction or warnings to the patient - e.g. \"with meals\", \"may cause drowsiness\"　患者への補足的な指示または警告-例： 「食事と一緒に」、「眠気を引き起こす可能性があります」"
* dosageInstruction.additionalInstruction ^definition = "Supplemental instructions to the patient on how to take the medication  (e.g. \"with meals\" or\"take half to one hour before food\") or warnings for the patient about the medication (e.g. \"may cause drowsiness\" or \"avoid exposure of skin to direct sunlight or sunlamps\").\r\n\r\n薬の服用方法に関する補足的な指示（例：「食事と一緒に」または「食事の30分から1時間前に服用」）または薬に関する患者への警告（例：「眠気を引き起こす可能性がある」または「皮膚の露出を避ける」直射日光またはサンランプ」）。"
* dosageInstruction.patientInstruction ^short = "Patient or consumer oriented instructions　患者または消費者向けの指示"
* dosageInstruction.patientInstruction ^definition = "Instructions in terms that are understood by the patient or consumer.\r\n\r\n患者または消費者が理解できる用語での指示。"
* dosageInstruction.timing 1..
* dosageInstruction.timing ^short = "When medication should be administered　投与日時"
* dosageInstruction.timing ^definition = "When medication should be administered.　\r\n\r\n投与日時、服用タイミング。\r\n【JP-CORE】\r\n必須。dosageInstruction.timing.code.coding.code, dosageInstruction.timing.code.coding.system が必ず存在しなければならない。"
* dosageInstruction.timing.code.coding.system 1..
* dosageInstruction.timing.code.coding.code 1..
* dosageInstruction.asNeeded[x] ^short = "Take \"as needed\" (for x)　「必要に応じて」（xの場合）"
* dosageInstruction.asNeeded[x] ^definition = "Indicates whether the Medication is only taken when needed within a specific dosing schedule (Boolean option), or it indicates the precondition for taking the Medication (CodeableConcept).\r\n\r\n特定の投薬スケジュール内で必要な場合にのみ薬を服用するか（ブールオプション）、または薬を服用するための前提条件（CodeableConcept）を示す。"
* dosageInstruction.asNeeded[x] ^comment = "Can express \"as needed\" without a reason by setting the Boolean = True.  In this case the CodeableConcept is not populated.  Or you can express \"as needed\" with a reason by including the CodeableConcept.  In this case the Boolean is assumed to be True.  If you set the Boolean to False, then the dose is given according to the schedule and is not \"prn\" or \"as needed\".\r\n\r\nブール値= Trueを設定することにより、理由なしに「必要に応じて」表現できる。この場合、CodeableConceptは設定されないか、またはCodeableConceptを含めることで、理由を付けて「必要に応じて」表現することもできる。この場合、ブール値はTrueであると見なされます。\r\nブール値をFalseに設定すると、投与量はスケジュールに従って与えられ、「prn」（ ＝as needed/as requiredの略記号）または「必要に応じて」ではありません。"
* dosageInstruction.site ^short = "Body site to administer to　投与部位"
* dosageInstruction.site ^definition = "Body site to administer to.　\r\n投与部位（人体の部位）"
* dosageInstruction.site ^comment = "If the use case requires attributes from the BodySite resource (e.g. to identify and track separately) then use the standard extension [bodySite](extension-bodysite.html).  May be a summary code, or a reference to a very precise definition of the location, or both.\r\n\r\nユースケースでBodySiteリソースの属性が必要な場合（たとえば、個別に識別して追跡するため）、標準の拡張機能[bodySite]（extension-bodysite.html）を使用する。要約コード、または場所の非常に正確な定義への参照、あるいはその両方である可能性がある。"
* dosageInstruction.route ^short = "How drug should enter body　薬が身体に入る経路"
* dosageInstruction.route ^definition = "How drug should enter body.\r\n薬が身体に入る経路\r\n\r\n【JP-CORE】\r\n HL7 V2(HL7表0162)"
* dosageInstruction.route ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\nすべてのターミノロジーの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係とpre-coordinationとpost-coordinationの用語関係を管理するための独自の構造を提供する必要がある。"
* dosageInstruction.route ^requirements = "A code specifying the route or physiological path of administration of a therapeutic agent into or onto a patient's body.\r\n\r\n患者の体内または体内へ​​の治療薬の投与経路または生理学的経路を指定するコード。"
* dosageInstruction.method ^short = "Technique for administering medication　投与手技"
* dosageInstruction.method ^definition = "Technique for administering medication.\r\n\r\n投与手技\r\n【JP-CORE】\r\nJAMI処方・注射オーダ標準用法規格(用法詳細区分)。"
* dosageInstruction.doseAndRate ^definition = "The amount of medication administered."
* substitution ^short = "Whether a substitution was performed on the dispense　調剤で置換が実行されたかどうか。"
* substitution ^definition = "Indicates whether or not substitution was made as part of the dispense. In some cases, substitution will be expected but does not happen, in other cases substitution is not expected but does happen. This block explains what substitution did or did not happen and why. If nothing is specified, substitution was not done. \r\n 調剤の一部として置換が行われたかどうかを示す。場合によっては、置換が期待されるが発生しない場合もあれば、置換が予期されないが発生する場合もある。このブロックは、置換が行われたか行われなかったか、およびその理由を説明する。何も指定されていない場合、置換は行われていない。"
* substitution.wasSubstituted ^short = "Whether a substitution was or was not performed on the dispense　調剤で置換が実行されたか、あるいはされていないかを'true'または'false'で表す。"
* substitution.wasSubstituted ^definition = "True if the dispenser dispensed a different drug or product from what was prescribed. \r\n処方されたものとは異なる薬剤または製品を調剤した場合に、'true'を設定する。"
* substitution.type ^short = "Code signifying whether a different drug was dispensed from what was prescribed　処方されたものとは異なる薬が調剤されたかどうかを示すコード"
* substitution.type ^definition = "A code signifying whether a different drug was dispensed from what was prescribed.\r\n\r\n処方されたものとは異なる薬が調剤されたかどうかを示すコード。\r\n【JP-CORE】\r\nHL7 v3 Value Set ActSubstanceAdminSubstitutionCode　から以下のコードが使用できる。 \r\nE: 別の生物学的同等および治療的に同等の製品で置換が行われたか、許可された。\r\nEC: 代替品が発生したか、次のような別の製品で許可されています：同じ有効成分を含むが異なる塩で処方された代替医薬品、同じ有効成分を持つエステル医薬品同等物、強度、剤形、投与経路.\r\nBC: 代替が発生したか、同等のブランド間で許可されていますが、ジェネリックでは許可されない。\r\nG: 代替が発生したか、同等のジェネリック間で許可されていますが、ブランド間では許可されていません。\r\nTE:同じ治療目的と安全性プロファイルを持つ別の製品で代替が発生したか、許可された。\r\nTB:ジェネリック医薬品ではなく、治療的に同等のブランド間で代替品が発生したか、許可されています\r\nTG:治療的に同等のジェネリック間で置換が発生したか、許可されていますが、ブランドは許可されない。\r\nF:処方ガイドラインに準拠。\r\nN:置換は発生しなかったか、許可されていない。"
* substitution.type ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination."
* substitution.reason ^short = "Why was substitution made　置換が実施された理由"
* substitution.reason ^definition = "Indicates the reason for the substitution (or lack of substitution) from what was prescribed.\r\n\r\n処方されたものからの置換（または置換の欠如）の理由を示します。\r\nHL7 v3 Value Set SubstanceAdminSubstitutionReason　では以下のコードが定義されている。\r\nCT:治療継続性確保のため、FP:処方方針、 OS: 在庫欠品、  RR:代替えを義務付けまたは禁止する規制要件に従った"
* substitution.reason ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\nすべてのターミノロジーの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係とpre-coordinationとpost-coordinationの用語関係を管理するための独自の構造を提供する必要がある。"
* substitution.responsibleParty ^short = "Who is responsible for the substitution　置換責任者"
* substitution.responsibleParty ^definition = "The person or organization that has primary responsibility for the substitution.\r\n\r\n置換の主な責任を負う個人または組織。Practitioner   PractitionerRole リソースへの参照。"
* substitution.responsibleParty ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* detectedIssue ^short = "Clinical issue with action アクションを伴う臨床的問題"
* detectedIssue ^definition = "Indicates an actual or potential clinical issue with or between one or more active or proposed clinical actions for a patient; e.g. drug-drug interaction, duplicate therapy, dosage alert etc.\r\n\r\n患者に対する1つまたは複数のアクティブまたは提案された臨床アクションを伴う、またはそれらの間の実際のまたは潜在的な臨床問題を示す。例えば薬物間相互作用、重複治療、投与量アラートなど。\r\nDetectedIssue リソースへの参照。"
* eventHistory ^short = "A list of relevant lifecycle events　関連するライフサイクルイベントのリスト"
* eventHistory ^definition = "A summary of the events of interest that have occurred, such as when the dispense was verified.\r\n\r\n\r\n調剤が確認されたときなど、発生した対象のイベントのサマリー。"


Extension: JP_MedicationDispense_Preparation
Id: 41bcb8d5-3940-4baf-8b00-9b8fbaa8ae5d
Title: "JP_MedicationDispense_Preparation"
Description: "薬剤単位の調剤結果"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDispense_Preparation"
* ^date = "2022-03-16"
* ^purpose = "薬剤単位の調剤結果"
* ^context.type = #element
* ^context.expression = "MedicationDispense"
* . ^short = "調剤についてのExtension"
* . ^definition = "一包化、粉砕などの処理を行った際に記載する。"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDispense_Preparation" (exactly)
* value[x] only string or CodeableConcept
* value[x] ^short = "調剤結果"
* value[x] ^definition = "薬剤単位の調剤結果"