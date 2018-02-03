package com.niit.Products.pojos;

import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

@Component
public class Demohandler {
 
	public UserBean initFlow(){
		return new UserBean();
	}
 
	public String validateDetails(UserBean userBean,MessageContext messageContext){
		String status = "success";
		if(userBean.getUserId().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"userId").defaultText("UserName cannot be Empty").build());
			status = "failure";
		}
		if(userBean.getDoor().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"door").defaultText("Doorno cannot be Empty").build());
			status = "failure";
		}
		if(userBean.getState().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"state").defaultText("State cannot be Empty").build());
			status = "failure";
		}
		if(userBean.getCity().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"city").defaultText("City cannot be Empty").build());
			status = "failure";
		}
		if(userBean.getStreet().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source(
					"street").defaultText("Street cannot be Empty").build());
			status = "failure";
		}
		return status;
	}
}
