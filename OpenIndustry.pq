section OpenIndustry;

[DataSource.Kind="OpenIndustry", Publish="OpenIndustry.Publish"]
shared OpenIndustry.OData = Value.ReplaceType(OpenIndustryExecute, type function (URL as Uri.Type) as any);

OpenIndustryExecute = (URL as text) =>
    let
        apiKey = Extension.CurrentCredential()[Key],
    headers = [
        #"Authorization" = "Bearer " & apiKey
    ],
        source = OData.Feed(URL & "/odata/", headers, [ Implementation="2.0"])
    in
        source;

// Data Source Kind description
OpenIndustry = [
    // Declares the supported type(s) of authentication.
    // In this case, Implicit = Key web access
    Authentication = [
        Key = [
        Label = "Open Industry Key"
        ]
    ],
    // Assigns a label to the data source credential.
    // This will be displayed in the "Manage Data Sources" dialog.
    Label = "OpenIndustry"
];

// Data Source UI publishing description
OpenIndustry.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = { "OpenIndustry", "OpenIndustry" }
];