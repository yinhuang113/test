jQuery(function()
{
  $('.userTable').find('.btn-comment').click(function(e)
  {
    var parentContainerTable = $(this).parentsUntil('table').parent();
    var parentContainerCell = parentContainerTable.parent().parent();
    var emailLinkObj = parentContainerTable.find('.emailLink');
    //console.log(parentContainerCell);
    if ($($(this).attr('href')).height() == 0)
    {
      parentContainerCell.css({'background':'none'});
      emailLinkObj.css({'display':'none'});
      $(this).css({'background':'#9dd000'});
    }
    else
    {
      parentContainerCell.removeAttr('style');
      emailLinkObj.css({'display':'block'});
      $(this).removeAttr('style');
    }
  });
  //-- profile tab team agent change select picker -
  $('.selectpicker').selectpicker();
  //-- styledcheckbox
  $('.styledCheckbox').checkbox({ cls:'jqueryCheckbox', empty:'assets/empty.png' });
  //-- styledradio
  $('.styledRadio').checkbox({ cls:'jqueryRadio', empty:'assets/empty.png' });
});

