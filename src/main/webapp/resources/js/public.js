document.addEventListener("DOMContentLoaded", function() {
	iniciarReveal();
	iniciarTilt();
	iniciarCursorOrb();
	iniciarFundoInterativo();
});


function iniciarReveal() {

	const elementos = document.querySelectorAll(".reveal");

	if (!elementos.length) {
		return;
	}

	const observer = new IntersectionObserver(
		function(entries) {

			entries.forEach(function(entry) {

				if (entry.isIntersecting) {

					entry.target.classList.add("show");

					observer.unobserve(entry.target);

				}

			});

		},
		{
			threshold: 0.12
		}
	);

	elementos.forEach(function(elemento) {

		observer.observe(elemento);

	});

}


function iniciarTilt() {

	const cards = document.querySelectorAll(".tilt-card");

	if (!cards.length) {
		return;
	}

	const reduzirMovimento =
		window.matchMedia("(prefers-reduced-motion: reduce)").matches;

	if (reduzirMovimento) {
		return;
	}

	cards.forEach(function(card) {

		card.addEventListener("mousemove", function(event) {

			const rect = card.getBoundingClientRect();

			const x =
				(event.clientX - rect.left) / rect.width - 0.5;

			const y =
				(event.clientY - rect.top) / rect.height - 0.5;

			card.style.transform =
				"perspective(900px) " +
				"rotateX(" + (-y * 3).toFixed(2) + "deg) " +
				"rotateY(" + (x * 4).toFixed(2) + "deg) " +
				"translateY(-4px)";

		});

		card.addEventListener("mouseleave", function() {

			card.style.transform = "";

		});

	});

}


function iniciarCursorOrb() {

	const orb = document.getElementById("cursorOrb");

	if (!orb) {
		return;
	}

	const reduzirMovimento =
		window.matchMedia("(prefers-reduced-motion: reduce)").matches;

	if (reduzirMovimento) {
		return;
	}

	let mouseX = window.innerWidth / 2;
	let mouseY = window.innerHeight / 2;

	let orbX = mouseX;
	let orbY = mouseY;

	window.addEventListener("mousemove", function(event) {

		mouseX = event.clientX;
		mouseY = event.clientY;

	});

	function animarOrb() {

		orbX += (mouseX - orbX) * 0.08;
		orbY += (mouseY - orbY) * 0.08;

		orb.style.left = orbX + "px";
		orb.style.top = orbY + "px";

		requestAnimationFrame(animarOrb);

	}

	animarOrb();

}


function iniciarFundoInterativo() {

	const canvas = document.getElementById("robot-bg");

	if (!canvas) {
		return;
	}

	const reduzirMovimento =
		window.matchMedia("(prefers-reduced-motion: reduce)").matches;

	if (reduzirMovimento) {
		return;
	}

	const ctx = canvas.getContext("2d");

	if (!ctx) {
		return;
	}

	let devicePixelRatio =
		Math.min(window.devicePixelRatio || 1, 2);

	let particulas = [];

	const mouse = {
		x: -9999,
		y: -9999
	};


	function redimensionar() {

		devicePixelRatio =
			Math.min(window.devicePixelRatio || 1, 2);

		canvas.width =
			window.innerWidth * devicePixelRatio;

		canvas.height =
			window.innerHeight * devicePixelRatio;

		canvas.style.width =
			window.innerWidth + "px";

		canvas.style.height =
			window.innerHeight + "px";

		ctx.setTransform(
			devicePixelRatio,
			0,
			0,
			devicePixelRatio,
			0,
			0
		);

		const quantidade =
			window.innerWidth < 700
				? 36
				: 80;

		particulas = [];

		for (let i = 0; i < quantidade; i++) {

			particulas.push({

				x:
					Math.random() *
					window.innerWidth,

				y:
					Math.random() *
					window.innerHeight,

				vx:
					(Math.random() - 0.5) *
					0.22,

				vy:
					(Math.random() - 0.5) *
					0.22,

				raio:
					Math.random() * 2.5 + 1.8

			});

		}

	}


	window.addEventListener(
		"resize",
		redimensionar
	);


	window.addEventListener(
		"mousemove",
		function(event) {

			mouse.x = event.clientX;
			mouse.y = event.clientY;

		}
	);


	window.addEventListener(
		"mouseleave",
		function() {

			mouse.x = -9999;
			mouse.y = -9999;

		}
	);


	function desenhar() {

		ctx.clearRect(
			0,
			0,
			window.innerWidth,
			window.innerHeight
		);


		particulas.forEach(function(particula) {

			particula.x += particula.vx;
			particula.y += particula.vy;


			if (particula.x < -10) {

				particula.x =
					window.innerWidth + 10;

			}


			if (
				particula.x >
				window.innerWidth + 10
			) {

				particula.x = -10;

			}


			if (particula.y < -10) {

				particula.y =
					window.innerHeight + 10;

			}


			if (
				particula.y >
				window.innerHeight + 10
			) {

				particula.y = -10;

			}


			const dx =
				particula.x - mouse.x;

			const dy =
				particula.y - mouse.y;

			const distancia =
				Math.hypot(dx, dy);


			if (distancia < 120) {

				const forca =
					(120 - distancia) /
					120;

				particula.x +=
					(dx / (distancia || 1)) *
					forca *
					1.25;

				particula.y +=
					(dy / (distancia || 1)) *
					forca *
					1.25;

			}


			ctx.beginPath();

			ctx.arc(
				particula.x,
				particula.y,
				particula.raio,
				0,
				Math.PI * 2
			);

			ctx.fillStyle =
				"rgba(25, 135, 84, 0.42)";

			ctx.fill();

		});


		for (
			let i = 0;
			i < particulas.length;
			i++
		) {

			for (
				let j = i + 1;
				j < particulas.length;
				j++
			) {

				const a =
					particulas[i];

				const b =
					particulas[j];


				const distancia =
					Math.hypot(
						a.x - b.x,
						a.y - b.y
					);


				if (distancia < 170) {

					ctx.beginPath();

					ctx.moveTo(
						a.x,
						a.y
					);

					ctx.lineTo(
						b.x,
						b.y
					);

					const opacidade =
						(1 - distancia / 170) *
						0.28;

					ctx.strokeStyle =
						"rgba(39, 93, 143, " +
						opacidade +
						")";

					ctx.lineWidth = 1.4;

					ctx.stroke();

				}

			}


			const particula =
				particulas[i];


			const distanciaMouse =
				Math.hypot(
					particula.x - mouse.x,
					particula.y - mouse.y
				);


			if (distanciaMouse < 210) {

				ctx.beginPath();

				ctx.moveTo(
					particula.x,
					particula.y
				);

				ctx.lineTo(
					mouse.x,
					mouse.y
				);

				const opacidade =
					(1 -
						distanciaMouse /
						210) *
					0.30;

				ctx.strokeStyle =
					"rgba(25, 135, 84, " +
					opacidade +
					")";

				ctx.lineWidth = 1.4;

				ctx.stroke();

			}

		}


		requestAnimationFrame(
			desenhar
		);

	}


	redimensionar();

	desenhar();

}