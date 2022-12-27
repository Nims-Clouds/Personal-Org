import { api, LightningElement,wire } from 'lwc';
import transactions from '@salesforce/apex/ft.transactions';
import TotalAmount from '@salesforce/apex/ft.TotalAmount';
import saveamount from '@salesforce/apex/ft.saveamount';

import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import Name from "@salesforce/schema/Person__c.Name";


const fields = [Name];

export default class FT1 extends LightningElement {
    @api recordId;
    data;
    CashData;
    BankData;
    
    columns = [
        { label: 'Id', fieldName: 'Name' },
        { label: 'Amount', fieldName: 'Amount__c' },
        { label: 'Date', fieldName: 'Date__c' },
        { label: 'Transaction Method', fieldName: 'Transaction_method__c' },
    ];

    @wire(getRecord, {
        recordId: "$recordId",
        fields
      })
      person;

      get name() {
        return getFieldValue(this.person.data,Name);
      }

      constructor(){
        super();
       
      }

    connectedCallback(){
       
        TotalAmount({recordid: this.recordId}).then(response =>{
            this.income = response[0];
            this.expense = response[1];
            this.TotalAmount = response[2];
          })

          transactions({recordid: this.recordId}).then(result =>{
            this.data = result;
        })

        saveamount({recordid: this.recordId}).then(result =>{
            this.CashData = result[0];
            this.BankData = result[1];
        })
       
    }

}