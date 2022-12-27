import { api, LightningElement,wire } from 'lwc';
import transactions from '@salesforce/apex/ft.transactions';
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import Name from "@salesforce/schema/Person__c.Name";


const fields = [Name];

export default class FT1 extends LightningElement {
    @api recordId;
    data;
    columns = [
        { label: 'Id', fieldName: 'name' },
        { label: 'Amount', fieldName: 'website' },
        { label: 'Date', fieldName: 'phone' },
        { label: 'Transaction Method', fieldName: 'amount' },
    ];

    @wire(getRecord, {
        recordId: "$recordId",
        fields
      })
      person;

      get name() {
        return getFieldValue(this.person.data,Name);
      }

    connectedCallback(){
        transactions({recordid: this.recordId}).then(response =>{
            this.data = response;
        })
    }

}