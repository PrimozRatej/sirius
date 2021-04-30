SELECT SYSDATE() as timestamp, 'start app_templates_v.sql' as decsription;
insert into app_templates
    (id, app_id, obj_id, name, file_extension, file_data, description)
values
    (1, 1, 1, 'report_01', 'doc', '<p>{{name}}</p>{{#items}}<h2>{{id}}</h2><small>quaType = {{quaType}}</small><p>{{name}}</p>{{/items}}', 'Template for dev testing.');

insert into app_templates
    (id, app_id, obj_id, name, file_extension, file_data, description)
values
    (2, 1, 1, 'report_01', 'pdf', '<!DOCTYPE html>
<html>

<head>
    <link rel="preconnect" href="https://fonts.gstatic.com"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet"/>
</head>

<body>

    <div style="padding-bottom: 50px;">
        <div style="background-color: lightgrey;">
            <table style="border-collapse: collapse; width: 100%;" border: 0>
                <tbody>
                    <tr>
                        <td style="width: 31.0605%;"><img src="{{logoImgPath}}" alt="logo" width="180"
                                height="61" /></td>
                        <td
                            style="width: 43.4186%; text-align: center;  font-family: Trirong, serif; font-family: "Roboto", sans-serif; font-size: 22px;">
                            <b>Inventory monthly report</b>
                        </td>
                        <td style="width: 25.5208%; text-align: right; vertical-align: top; font-size: 12px;">{{storeName}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div style="padding-bottom: 50px;">
        <div style="padding-left: 15px;">
            <div style="background-color: lightgrey; padding: 5px;">
                <table style="border-collapse: collapse; width: 100%;" border: 0>
                    <tbody>
                        <tr>
                            <td style="font-size: 12px;">Requsition date: {{dateNow0}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div style="padding-bottom: 50px;">
        <div style="padding-left: 15px;">
            <div style="background-color: lightgrey; padding: 3px;">
                <table style="border-collapse: collapse; border-style: hidden; width: 100%;" border: 0>
                    <thead>
                        <tr>
                            <th rowspan="2" style="font-size: 12px; vertical-align: top; border: 1px solid grey;">SOURCE
                            </th>
                            <th colspan="2" style="font-size: 12px; text-align: center; border: 1px solid grey;">Item
                            </th>
                            <th style="font-size: 12px; border: 1px solid grey;">Order</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Pack</th>
                            <th style="font-size: 12px; border: 1px solid grey;">On</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Suggested</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Confirmed</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Shipped</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Received</th>


                        </tr>
                        <tr>
                            <th style="font-size: 12px; border: 1px solid grey;">ID</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Description</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Quantity</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Size</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Hand</th>
                        </tr>
                    </thead>
                    <tbody>
                        {{#inventoryList}}
                        <tr>
                            <td></td>
                            <td style="font-size: 12px; border: 1px solid grey;">{{id}}</td>
                            <td style="font-size: 12px; border: 1px solid grey;">{{description}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{quantity}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{size}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{inHand}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{suggested}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{confirmed}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{shipped}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{received}}</td>
                        </tr>
                        {{/inventoryList}}
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <footer>
        <div style="padding-left: 15px;">
            <div style="background-color: lightgrey; padding: 5px;">
                <table style="border-collapse: collapse; width: 100%;" border: 0>
                    <tbody>
                        <tr>
                            <td style="font-size: 12px; text-align: left">Generated by {{userNameSurname}}</td>
                            <td style="font-size: 12px; text-align: right">Date: {{dateNow1}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </footer>

</body>

</html>', 'Template for dev testing.');

insert into app_templates
    (id, app_id, obj_id, name, file_extension, file_data, description)
values
    (3, 1, 1, 'report_02', 'pdf', '<!DOCTYPE html>
<html>

<head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
</head>

<body>

    <div style="padding-bottom: 50px;">
        <div style="background-color: lightblue;">
            <table style="border-collapse: collapse; width: 100%;" border = 0>
                <tbody>
                    <tr>
                        <td style="width: 31.0605%;"><img src="{{logoImgPath}}" alt="logo" width="180"
                                height="61" /></td>
                        <td
                            style="width: 43.4186%; text-align: center;  font-family: Trirong, serif; font-family: "Roboto", sans-serif; font-size: 22px;">
                            <b>Inventory yearly report</b>
                        </td>
                        <td style="width: 25.5208%; text-align: right; vertical-align: top; font-size: 12px;">{{storeName}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div style="padding-bottom: 50px;">
        <div style="padding-left: 15px;">
            <div style="background-color: lightblue; padding: 5px;">
                <table style="border-collapse: collapse; width: 100%;" border = 0>
                    <tbody>
                        <tr>
                            <td style="font-size: 12px;">Requsition date: {{dateNow0}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div style="padding-bottom: 50px;">
        <div style="padding-left: 15px;">
            <div style="background-color: lightgrey; padding: 3px;">
                <table style="border-collapse: collapse; border-style: hidden; width: 100%;" border = 0>
                    <thead>
                        <tr>
                            <th rowspan="2" style="font-size: 12px; vertical-align: top; border: 1px solid grey;">SOURCE
                            </th>
                            <th colspan="2" style="font-size: 12px; text-align: center; border: 1px solid grey;">Item
                            </th>
                            <th style="font-size: 12px; border: 1px solid grey;">Order</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Pack</th>
                            <th style="font-size: 12px; border: 1px solid grey;">On</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Suggested</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Confirmed</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Shipped</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Received</th>


                        </tr>
                        <tr>
                            <th style="font-size: 12px; border: 1px solid grey;">ID</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Description</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Quantity</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Size</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Hand</th>
                        </tr>
                    </thead>
                    <tbody>
                        {{#inventoryList}}
                        <tr>
                            <td></td>
                            <td style="font-size: 12px; border: 1px solid grey;">{{id}}</td>
                            <td style="font-size: 12px; border: 1px solid grey;">{{description}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{quantity}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{size}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{inHand}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{suggested}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{confirmed}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{shipped}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{received}}</td>
                        </tr>
                        {{/inventoryList}}
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <footer>
        <div style="padding-left: 15px;">
            <div style="background-color: lightgrey; padding: 5px;">
                <table style="border-collapse: collapse; width: 100%;" border = 0>
                    <tbody>
                        <tr>
                            <td style="font-size: 12px; text-align: left">Generated by {{userNameSurname}}</td>
                            <td style="font-size: 12px; text-align: right">Date: {{dateNow1}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </footer>

</body>

</html>', 'Template for dev testing.');


insert into app_templates
    (id, app_id, obj_id, name, file_extension, file_data, description)
values
    (4, 1, 1, 'report_01', 'doc', '<!DOCTYPE html>
<html>

<body>

    <div style="padding-bottom: 50px;">
        <div style="background-color: lightgrey;">
            <table style="border-collapse = collapse; width: 100%;" border = "0">
                <tbody>
                    <tr>
                        <td style="width: 31.0605%;"><img src="{{logoImgPath}}" alt="logo" width="180"
                                height="61"></img></td>
                        <td
                            style="width: 43.4186%; text-align: center; font-size: 22px;">
                            <b>Inventory yearly report</b>
                        </td>
                        <td style="width: 25.5208%; text-align: right; vertical-align: top; font-size: 12px;">{{storeName}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div style="padding-bottom: 50px;">
        <div style="padding-left: 15px;">
            <div style="background-color: lightgrey; padding: 5px;">
                <table style="border-collapse: collapse; width: 100%;" border = "0">
                    <tbody>
                        <tr>
                            <td style="font-size: 12px;">Requsition date: {{dateNow0}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div style="padding-bottom: 50px;">
        <div style="padding-left: 15px;">
            <div style="background-color: lightgrey; padding: 3px;">
                <table style="border-collapse: collapse; border-style: hidden; width: 100%;" border = "0">
                    <thead>
                        <tr>
                            <th rowspan="2" style="font-size: 12px; vertical-align: top; border: 1px solid grey;">SOURCE
                            </th>
                            <th colspan="2" style="font-size: 12px; text-align: center; border: 1px solid grey;">Item
                            </th>
                            <th style="font-size: 12px; border: 1px solid grey;">Order</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Pack</th>
                            <th style="font-size: 12px; border: 1px solid grey;">On</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Suggested</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Confirmed</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Shipped</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Received</th>


                        </tr>
                        <tr>
                            <th style="font-size: 12px; border: 1px solid grey;">ID</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Description</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Quantity</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Size</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Hand</th>
                        </tr>
                    </thead>
                    <tbody>
                        {{#inventoryList}}
                        <tr>
                            <td></td>
                            <td style="font-size: 12px; border: 1px solid grey;">{{id}}</td>
                            <td style="font-size: 12px; border: 1px solid grey;">{{description}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{quantity}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{size}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{inHand}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{suggested}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{confirmed}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{shipped}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{received}}</td>
                        </tr>
                        {{/inventoryList}}
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <footer>
        <div style="padding-left: 15px;">
            <div style="background-color: lightgrey; padding: 5px;">
                <table style="border-collapse: collapse; width: 100%;" border = "0">
                    <tbody>
                        <tr>
                            <td style="font-size: 12px; text-align: left">Generated by {{userNameSurname}}</td>
                            <td style="font-size: 12px; text-align: right">Date: {{dateNow1}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </footer>

</body>

</html>', 'Template for dev testing.');

insert into app_templates
    (id, app_id, obj_id, name, file_extension, file_data, description)
values
    (5, 1, 1, 'report_01', 'html', '<!DOCTYPE html>
<html>

<body>

    <div style="padding-bottom: 50px;">
        <div style="background-color: lightgrey;">
            <table style="border-collapse = collapse; width: 100%;" border = "0">
                <tbody>
                    <tr>
                        <td style="width: 31.0605%;"><img src="{{logoImgPath}}" alt="logo" width="180"
                                height="61"></img></td>
                        <td
                            style="width: 43.4186%; text-align: center; font-size: 22px;">
                            <b>Inventory yearly report</b>
                        </td>
                        <td style="width: 25.5208%; text-align: right; vertical-align: top; font-size: 12px;">{{storeName}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div style="padding-bottom: 50px;">
        <div style="padding-left: 15px;">
            <div style="background-color: lightgrey; padding: 5px;">
                <table style="border-collapse: collapse; width: 100%;" border = "0">
                    <tbody>
                        <tr>
                            <td style="font-size: 12px;">Requsition date: {{dateNow0}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div style="padding-bottom: 50px;">
        <div style="padding-left: 15px;">
            <div style="background-color: lightgrey; padding: 3px;">
                <table style="border-collapse: collapse; border-style: hidden; width: 100%;" border = "0">
                    <thead>
                        <tr>
                            <th rowspan="2" style="font-size: 12px; vertical-align: top; border: 1px solid grey;">SOURCE
                            </th>
                            <th colspan="2" style="font-size: 12px; text-align: center; border: 1px solid grey;">Item
                            </th>
                            <th style="font-size: 12px; border: 1px solid grey;">Order</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Pack</th>
                            <th style="font-size: 12px; border: 1px solid grey;">On</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Cancelled</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Completed</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Shipped</th>
                            <th rowspan="2" style="font-size: 12px; border: 1px solid grey; vertical-align: top;">
                                Received</th>


                        </tr>
                        <tr>
                            <th style="font-size: 12px; border: 1px solid grey;">ID</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Description</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Quantity</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Disputed</th>
                            <th style="font-size: 12px; border: 1px solid grey;">Hand</th>
                        </tr>
                    </thead>
                    <tbody>
                        {{#inventoryList}}
                        <tr>
                            <td></td>
                            <td style="font-size: 12px; border: 1px solid grey;">{{id}}</td>
                            <td style="font-size: 12px; border: 1px solid grey;">{{name}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{awaitingFulfillment}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{disputed}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{inHand}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{cancelled}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{completed}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{shipped}}</td>
                            <td style="font-size: 12px; border: 1px solid grey; text-align: right">{{toBeReceived}}</td>
                        </tr>
                        {{/inventoryList}}
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <footer>
        <div style="padding-left: 15px;">
            <div style="background-color: lightgrey; padding: 5px;">
                <table style="border-collapse: collapse; width: 100%;" border = "0">
                    <tbody>
                        <tr>
                            <td style="font-size: 12px; text-align: left">Generated by {{userNameSurname}}</td>
                            <td style="font-size: 12px; text-align: right">Date: {{dateNow1}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </footer>

</body>

</html>', 'Template for dev testing.');


