package br.edu.ifms.portalrobotica.model;

public class Estudante {
	private long id;
	private String nome;
	private String minibio;
	private String foto;
	
	public Estudante() {
		
		
	}

	public Estudante(String nome, String minibio, String foto) {

		this.nome = nome;
		this.minibio = minibio;
		this.foto = foto;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getMinibio() {
		return minibio;
	}

	public void setMinibio(String minibio) {
		this.minibio = minibio;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

}
