package com.ensah.bo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Entity
@Data @NoArgsConstructor @AllArgsConstructor
public class Contact {
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message = "This field is required")
	private String  nom;
	
	@NotBlank(message = "This field is required")
	private String prenom;
	
    
	@Size(min = 10, max = 10, message = "Le numéro doit contenir 10 chiffres")
	@NotBlank(message = "This field is required")
	private String teleper;
	
	

	@Size(min = 10, max = 10, message = "Le numéro doit contenir 10 chiffres")
	@NotBlank(message = "This field is required")
	private String teleprof; //tele professionel
	
	@NotBlank(message = "This field is required")
	private String adresse;
	
	@NotBlank(message = "This field is required")
	private String emailper;//Emailpersonnel
	
	@NotBlank(message = "This field is required")
	private String emailprof;//Emailprofessionnel
	
	@NotBlank(message = "This field is required")
	private String genre ; //(male or female)
	
	@ManyToOne
    @JoinColumn(name = "group_id")
    private Groupe group;
	
	
	
	
	
}
