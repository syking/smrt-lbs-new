function submitCreateAccount(form) {
    $(form).validate({
        rules: {
            confirm_password: {
                equalTo: "#password"
            }
        },
        messages: {
            confirm_password: {
                equalTo: PASSWORD_CONFIRM_MISMATCH
            }
        }
    });
    submitForm(form, createAccountByVoucher_url, "Created account and user successfully!", null);
}

function updateVoucherTable(cond) {
    ajaxGet(searchVoucher_url, cond, populateVoucherTable);
}

function populateVoucherTable(data) {
    populate_with_page('#template-voucher-table', data.vouchers, '#voucher-list tbody');
}

function deleteVoucher(id, name) {
    var message = VOUCHER_DEL_CONFIRM.replace('#{name}', name);
    confirmAction(message, deleteVoucher_url, 'id='+id, VOUCHER_DELETED.replace('#{name}', name), updateVoucherTable);
}

function refreshVoucherTable(res) {
    updateVoucherTable();
}

function validateFunc()
{
    $.validator.addMethod('positiveNumber',
        function (value) { 
            return value == "" || Number(value) > 0;
        }, 
        'Enter a positive number.'
    );

    $.validator.addMethod('customDate',
        function (value) { 
            try{
                jQuery.datepicker.parseDate('yy-mm-dd', value);
                return true;
            }
            catch(e){
                return false;
            }
        },
        "Please enter a valid date."
    );
        
    $.validator.addMethod('nbrValidate',
        function (value) {
            var validStr="0123456789+-() ";
            
            for (var i=0; i<value.length; i++) {
                if (validStr.indexOf(value.charAt(i)) >= 0 )
                    continue;
                else
                    return false;                    
            }

            return true;
        },
        "Please enter a valid contact number."
    );
}

function submitEditVoucher(form) {
    validateFunc();
    
    $.removeData(form, 'validator');
    $(form).validate(
    {
        rules: {
            user_quota: {
                required : true ,
                positiveNumber : true
            },
            device_quota: {
                required : true ,
                positiveNumber : true
            },
            expiry_date: {
                required : true ,
                customDate : true
            },
            contact_number: {
                required : false ,
                nbrValidate : true
            }
        }
    }
    );  
    
    var name = $('#name').val();
    var message = VOUCHER_UPDATED.replace('#'+'{name}', name);
    submitForm(form, editVoucher_url, message, refreshVoucherTable);
}

function validateSearch(form)
{
    validateFunc();
    $.removeData(form, 'validator');
    
    $(form).validate(
    {
        rules : {
            user_quota : {
                positiveNumber : true
            },
            device_quota : {
                positiveNumber : true
            },
            expiry_date_start : {
                customDate : true
            },
            expiry_date_end : {
                customDate : true
            },
            contact_number : {
                nbrValidate : true
            }
        }
    }
    );  
}

function searchVoucher(form) {
    validateSearch(form);

    if (!$(form).valid())
        return false;
    
    var cond = {};
    $.each($(form).serializeArray(), function(i, field) {
        if (field.value) {
            cond[field.name] = field.value;
        }
    });
    currentPageIndex = 0;
    updateVoucherTable($.param(cond, true));
    return false;
}

function exportVoucher(form, format) {
    validateSearch(form);
    $(form).attr({
        action: '/api/voucher/export?format=' + format,
        method: 'post'
    });
    $(form).submit();
}

