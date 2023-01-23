/// enum for custom `TextFieldSuffix` type
enum SuffixType { percentage, checkButton }

/// for [TypeFilesPicker] extension type
enum FileExtension { jpg, png, svg, xlsx, xlsm, xlsb }

/// for class [RowTable] params
enum TableType { number, text, chip, link }

/// for class [ChipWidget] params
enum ChipType { light, normal }

/// for class [SidebarBodyProfile] params
enum RoleType { user, admin, manager }

/// for class [SidebarResponsive] params
enum ResponsiveType { mobile, tablet, desktop }

/// for Text field Row [TextFieldRow] params
enum FieldType { basic, dropdown }

/// condition of authentication
enum AuthState { initial, loading, loggedIn, notLoggedIn }

/// condition of load data
enum TypeState { initial, loading, loaded, notLoaded }

/// state of dialog
enum AnswerState { cancel, yesOk, third }

/// state of detail dialog
enum DatailDialogState { close, edit, delete }
