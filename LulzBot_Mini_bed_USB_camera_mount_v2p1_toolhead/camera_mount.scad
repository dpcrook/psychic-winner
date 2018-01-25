// Generated from camera_mount.py
$fa=20; $fs=0.2;


difference(){
	translate(v = [0, 0, 16.2000000000]) {
		rotate(a = 90, v = [0, -1, 0]) {
			difference() {
				union() {
					union() {
						union() {
							difference() {
								difference() {
									difference() {
										linear_extrude(center = false, height = 5.5000000000) {
											intersection() {
												rotate(a = 45) {
													translate(v = [-20, -20]) {
														square(size = [24, 40]);
													}
												}
												square(center = true, size = [32.4000000000, 32.4000000000]);
											}
										}
										translate(v = [-10, 0, 0]) {
											translate(v = [0, 0, 4.9000000000]) {
											}
										}
									}
									translate(v = [0, -10, 0]) {
										translate(v = [0, 0, 4.9000000000]) {
										}
									}
								}
								union() {
									cylinder(h = 4.0000000000, r = 14.6500000000);
									translate(v = [-5, -5, 0]) {
										cube(size = [15, 15, 5.5000200000]);
									}
								}
							}
							translate(v = [2, -38.5000000000, 39.0000000000]) {
								rotate(a = 141.7284958095, v = [0, 0, 1]) {
									rotate(a = 103.4903442936, v = [1, 0, 0]) {
										translate(v = [0, 0, -1.6500000000]) {
											union() {
												union() {
													union() {
														union() {
															difference() {
																translate(v = [-17.6750000000, -17.6750000000, -3.8000000000]) {
																	cube(center = false, size = [35.3500000000, 35.3500000000, 5.4500000000]);
																}
															}
															translate(v = [14.0000000000, 14.0000000000, 0]) {
																union() {
																	translate(v = [-2.0750000000, -2.0750000000, -1.8000000000]) {
																		cube(center = false, size = [4.1500000000, 4.1500000000, 1.8000000000]);
																	}
																	translate(v = [0, 0, -2.0000000000]) {
																		mirror(v = [0, 0, 1]) {
																		}
																	}
																}
															}
														}
														translate(v = [-14.0000000000, 14.0000000000, 0]) {
															union() {
																translate(v = [-2.0750000000, -2.0750000000, -1.8000000000]) {
																	cube(center = false, size = [4.1500000000, 4.1500000000, 1.8000000000]);
																}
																translate(v = [0, 0, -2.0000000000]) {
																	mirror(v = [0, 0, 1]) {
																	}
																}
															}
														}
													}
													translate(v = [-14.0000000000, -14.0000000000, 0]) {
														union() {
															translate(v = [-2.0750000000, -2.0750000000, -1.8000000000]) {
																cube(center = false, size = [4.1500000000, 4.1500000000, 1.8000000000]);
															}
															translate(v = [0, 0, -2.0000000000]) {
																mirror(v = [0, 0, 1]) {
																}
															}
														}
													}
												}
												translate(v = [14.0000000000, -14.0000000000, 0]) {
													union() {
														translate(v = [-2.0750000000, -2.0750000000, -1.8000000000]) {
															cube(center = false, size = [4.1500000000, 4.1500000000, 1.8000000000]);
														}
														translate(v = [0, 0, -2.0000000000]) {
															mirror(v = [0, 0, 1]) {
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
						polyhedron(faces = [[0, 2, 14], [15, 2, 0], [0, 7, 15], [14, 10, 0], [14, 2, 1], [1, 2, 15], [15, 3, 1], [1, 13, 14], [15, 4, 3], [6, 10, 14], [14, 13, 6], [7, 4, 15], [11, 7, 0], [0, 10, 11], [1, 3, 12], [12, 13, 1], [3, 4, 12], [8, 12, 4], [13, 5, 6], [9, 10, 6], [11, 4, 7], [9, 11, 10], [12, 8, 9], [13, 12, 9], [11, 8, 4], [5, 13, 9], [6, 5, 9], [8, 11, 9]], points = [[-16.2000000000, -42.5386946614, 22.0576121145], [-16.2000000000, -39.423557734, 53.4587175901], [-16.2000000000, -45.8977578213, 23.0840506837], [-16.2000000000, -27.6742687274, 53.2137720224], [-16.2000000000, -25.1168001852, 52.4322790208], [15.7801466406, -49.5696575051, 57.2137720224], [9.62235765664, -54.9938575924, 23.889105116], [-15.1499900000, -34.1484688147, 22.839105116], [-9.95488857563, -25.1168001852, 56.4322790208], [17.797849132, -47.0121889629, 56.4322790208], [12.6900601481, -53.4863890502, 22.0576121145], [-15.0626775596, -31.5910002725, 22.0576121145], [-12.6050052809, -28.4758633451, 57.4587175901], [15.1477324268, -50.3712521228, 57.4587175901], [10.0399434429, -56.8454522102, 23.0840506837], [-17.7127942648, -34.9500634324, 23.0840506837]]);
					}
					union() {
						union() {
							minkowski() {
								polyhedron(faces = [[0, 1, 2], [0, 2, 3], [1, 0, 4], [4, 5, 1], [2, 1, 5], [5, 6, 2], [3, 2, 6], [6, 7, 3], [0, 3, 7], [7, 4, 0], [6, 5, 4], [7, 6, 4]], points = [[-15.1500000000, 10.0000000000, 5.5000000000], [-15.1500000000, -10.0000000000, 5.5000000000], [-15.1499900000, -34.1484688147, 22.839105116], [-15.1499900000, -27.6742687274, 53.2137720224], [-15.1000000000, 10.0000000000, 5.5500000000], [-15.1000000000, -10.0000000000, 5.5500000000], [-15.0999900000, -34.1484688147, 22.889105116], [-15.0999900000, -27.6742687274, 53.2637720224]]);
								sphere(r = 1.0500000000);
							}
							minkowski() {
								polyhedron(faces = [[0, 1, 2], [1, 0, 3], [3, 4, 1], [2, 1, 4], [4, 5, 2], [0, 2, 5], [5, 3, 0], [5, 4, 3]], points = [[-15.1500000000, -10.0000000000, 5.5000000000], [-10.0000000000, -15.1500000000, 5.5000000000], [-15.1499900000, -34.1484688147, 22.839105116], [-15.1000000000, -10.0000000000, 5.5500000000], [-9.9500000000, -15.1500000000, 5.5500000000], [-15.0999900000, -34.1484688147, 22.889105116]]);
								sphere(r = 1.0500000000);
							}
						}
						minkowski() {
							polyhedron(faces = [[0, 1, 2], [0, 2, 3], [1, 0, 4], [4, 5, 1], [2, 1, 5], [5, 6, 2], [3, 2, 6], [6, 7, 3], [0, 3, 7], [7, 4, 0], [6, 5, 4], [7, 6, 4]], points = [[-10.0000000000, -15.1500000000, 5.5000000000], [10.0000000000, -15.1500000000, 5.5000000000], [9.62235765664, -54.9938575924, 23.889105116], [-15.1499900000, -34.1484688147, 22.839105116], [-9.9500000000, -15.1500000000, 5.5500000000], [10.0500000000, -15.1500000000, 5.5500000000], [9.67235765664, -54.9938575924, 23.939105116], [-15.0999900000, -34.1484688147, 22.889105116]]);
							sphere(r = 1.0500000000);
						}
					}
				}
				translate(v = [-216.2000000000, -100, -100]) {
					cube(size = [200, 200, 200]);
				}
			}
		}
	}
	/* Holes Below*/
	translate(v = [0, 0, 16.2000000000]){
		rotate(a = 90, v = [0, -1, 0]){
			difference(){
				union(){
					union(){
						union(){
							union(){
								union(){
									union(){
										translate(v = [-10, 0, 0]){
											translate(v = [0, 0, 4.9000000000]){
												union() {
													translate(v = [0, 0, -4.1500000000]) {
														cylinder(h = 4.1500000000, r = 1.6500000000);
													}
													cylinder(h = 2.5500000000, r = 3.1500000000);
												}
											}
										}
									}
									translate(v = [0, -10, 0]){
										translate(v = [0, 0, 4.9000000000]){
											union() {
												translate(v = [0, 0, -4.1500000000]) {
													cylinder(h = 4.1500000000, r = 1.6500000000);
												}
												cylinder(h = 2.5500000000, r = 3.1500000000);
											}
										}
									}
								}
							}
							translate(v = [2, -38.5000000000, 39.0000000000]){
								rotate(a = 141.7284958095, v = [0, 0, 1]){
									rotate(a = 103.4903442936, v = [1, 0, 0]){
										translate(v = [0, 0, -1.6500000000]){
											union(){
												union(){
													union(){
														union(){
															union(){
																union() {
																	union() {
																		union() {
																			union() {
																				union() {
																					translate(v = [-16.0750000000, -16.0750000000, 0]) {
																						cube(center = false, size = [32.1500000000, 32.1500000000, 1.6500100000]);
																					}
																					translate(v = [-16.0750000000, -11.9250000000, -1.8000000000]) {
																						cube(center = false, size = [32.1500000000, 23.8500000000, 1.8000100000]);
																					}
																				}
																				translate(v = [-11.9250000000, -16.0750000000, -1.8000000000]) {
																					cube(center = false, size = [23.8500000000, 32.1500000000, 1.8000100000]);
																				}
																			}
																			translate(v = [-9.6450000000, -17.6750000000, 0]) {
																				cube(center = false, size = [19.2900000000, 35.3500000000, 1.6500100000]);
																			}
																		}
																		translate(v = [-17.6750000000, -9.6450000000, 0]) {
																			cube(center = false, size = [35.3500000000, 19.2900000000, 1.6500100000]);
																		}
																	}
																	translate(v = [5, -13.3000000000, 0]) {
																		translate(v = [-5.7000000000, -2.8000000000, -15.0000000000]) {
																			cube(center = false, size = [11.4000000000, 5.6000000000, 15.0000000000]);
																		}
																	}
																}
															}
															translate(v = [14.0000000000, 14.0000000000, 0]){
																union(){
																	translate(v = [0, 0, -2.0000000000]){
																		mirror(v = [0, 0, 1]){
																			union() {
																				translate(v = [0, 0, -4.1500000000]) {
																					cylinder(h = 4.1500000000, r = 1.4000000000);
																				}
																				cylinder(h = 15.1500000000, r = 2.6500000000);
																			}
																		}
																	}
																}
															}
														}
														translate(v = [-14.0000000000, 14.0000000000, 0]){
															union(){
																translate(v = [0, 0, -2.0000000000]){
																	mirror(v = [0, 0, 1]){
																		union() {
																			translate(v = [0, 0, -4.1500000000]) {
																				cylinder(h = 4.1500000000, r = 1.4000000000);
																			}
																			cylinder(h = 15.1500000000, r = 2.6500000000);
																		}
																	}
																}
															}
														}
													}
													translate(v = [-14.0000000000, -14.0000000000, 0]){
														union(){
															translate(v = [0, 0, -2.0000000000]){
																mirror(v = [0, 0, 1]){
																	union() {
																		translate(v = [0, 0, -4.1500000000]) {
																			cylinder(h = 4.1500000000, r = 1.4000000000);
																		}
																		cylinder(h = 15.1500000000, r = 2.6500000000);
																	}
																}
															}
														}
													}
												}
												translate(v = [14.0000000000, -14.0000000000, 0]){
													union(){
														translate(v = [0, 0, -2.0000000000]){
															mirror(v = [0, 0, 1]){
																union() {
																	translate(v = [0, 0, -4.1500000000]) {
																		cylinder(h = 4.1500000000, r = 1.4000000000);
																	}
																	cylinder(h = 15.1500000000, r = 2.6500000000);
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	} /* End Holes */ 
}