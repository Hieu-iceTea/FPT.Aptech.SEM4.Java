package com.hieu_icetea.websocket_stomp_spring_guides.dto;

public class Greeting {

	private String content;

	public Greeting() {
	}

	public Greeting(String content) {
		this.content = content;
	}

	public String getContent() {
		return content;
	}

}
