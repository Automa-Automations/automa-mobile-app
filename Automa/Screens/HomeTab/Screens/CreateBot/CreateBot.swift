//
//  CreateBot.swift
//  Automa
//
//  Created by Simon Ferns on 2024/06/17.
//

import Foundation
import SwiftUI

struct CreateBot: View {
    var body: some View {
        VStack(alignment: .leading) {
            GenericTitle(title: "Create a bot", description: nil, padding: nil)
            VStack(alignment: .leading, spacing: 20) {
                TabView {
                    GroupBox {
                        VStack(spacing: 15) {
                            HStack(alignment: .top) {
                                Image("cute-animal-generator-temp")
                                Spacer()
                                Text("Trending Now")
                                    .font(.footnote)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                            HStack {
                                Text("Podcast Bot")
                                    .fontWeight(.bold)
                                    .font(.subheadline)
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundStyle(.green)
                                Spacer()
                            }
                        }
                        Spacer()
                        VStack(spacing: 20) {
                            HStack {
                                Text("An automation workflow that will generate cute animal images, and automatically post them on instagram.")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                Spacer()
                            }
                        }

                        HStack {
                            Image("logo-temp")
                            Text("Automa")
                                .font(.caption)

                            Spacer()

                            HStack {
                                Image(systemName: "heart")
                                    .font(.caption)
                                    .padding(.trailing, -3)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                Text("4.3k")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                            HStack {
                                Image(systemName: "plus.square.fill")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                    .padding(.trailing, -3)
                                Text("7.5m")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                        }
                    }.padding(.horizontal, 20)

                    GroupBox {
                        VStack(spacing: 15) {
                            HStack(alignment: .top) {
                                Image("cute-animal-generator-temp")
                                Spacer()
                                Text("Trending Now")
                                    .font(.footnote)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                            HStack {
                                Text("Bot2")
                                    .fontWeight(.bold)
                                    .font(.subheadline)
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundStyle(.green)
                                Spacer()
                            }
                        }
                        Spacer()
                        VStack(spacing: 20) {
                            HStack {
                                Text("An automation workflow that will generate cute animal images, and automatically post them on instagram.")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                Spacer()
                            }
                        }

                        HStack {
                            Image("logo-temp")
                            Text("Automa")
                                .font(.caption)

                            Spacer()

                            HStack {
                                Image(systemName: "heart")
                                    .font(.caption)
                                    .padding(.trailing, -3)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                Text("4.3k")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                            HStack {
                                Image(systemName: "plus.square.fill")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                    .padding(.trailing, -3)
                                Text("7.5m")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                        }
                    }.padding(.horizontal, 20)
                    GroupBox {
                        VStack(spacing: 15) {
                            HStack(alignment: .top) {
                                Image("cute-animal-generator-temp")
                                Spacer()
                                Text("Trending Now")
                                    .font(.footnote)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                            HStack {
                                Text("Cute Animals Generator")
                                    .fontWeight(.bold)
                                    .font(.subheadline)
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundStyle(.green)
                                Spacer()
                            }
                        }
                        Spacer()
                        VStack(spacing: 20) {
                            HStack {
                                Text("An automation workflow that will generate cute animal images, and automatically post them on instagram.")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                Spacer()
                            }
                        }

                        HStack {
                            Image("logo-temp")
                            Text("Automa")
                                .font(.caption)

                            Spacer()

                            HStack {
                                Image(systemName: "heart")
                                    .font(.caption)
                                    .padding(.trailing, -3)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                Text("4.3k")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                            HStack {
                                Image(systemName: "plus.square.fill")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                                    .padding(.trailing, -3)
                                Text("7.5m")
                                    .font(.caption)
                                    .foregroundStyle(Color(hex: 0x8E8E93))
                            }
                        }
                    }.padding(.horizontal, 20)
                }.tabViewStyle(.page(indexDisplayMode: .always))
                    .frame(height: 200)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        GroupBox {
                            VStack(spacing: 15) {
                                HStack(alignment: .top) {
                                    Image("cute-animal-generator-temp")
                                    Spacer()
                                }
                                HStack {
                                    Text("Instagram")
                                        .fontWeight(.bold)
                                        .font(.subheadline)
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundStyle(.green)
                                    Spacer()
                                }
                            }

                            Spacer().frame(height: 30)
                            VStack(spacing: 20) {
                                HStack {
                                    Text("A Instagram bot.")
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Spacer()
                                }
                            }

                            HStack {
                                Image("logo-temp")
                                Text("Automa")
                                    .font(.caption)

                                Spacer()

                                HStack {
                                    Image(systemName: "heart")
                                        .font(.caption)
                                        .padding(.trailing, -3)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Text("4.3k")
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                }
                            }
                        }
                        .frame(width: 170)

                        GroupBox {
                            VStack(spacing: 15) {
                                HStack(alignment: .top) {
                                    Image("cute-animal-generator-temp")
                                    Spacer()
                                }
                                HStack {
                                    Text("Instagram")
                                        .fontWeight(.bold)
                                        .font(.subheadline)
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundStyle(.green)
                                    Spacer()
                                }
                            }

                            Spacer().frame(height: 30)
                            VStack(spacing: 20) {
                                HStack {
                                    Text("A Instagram bot.")
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Spacer()
                                }
                            }

                            HStack {
                                Image("logo-temp")
                                Text("Automa")
                                    .font(.caption)

                                Spacer()

                                HStack {
                                    Image(systemName: "heart")
                                        .font(.caption)
                                        .padding(.trailing, -3)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Text("4.3k")
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                }
                            }
                        }
                        .frame(width: 170)
                        GroupBox {
                            VStack(spacing: 15) {
                                HStack(alignment: .top) {
                                    Image("cute-animal-generator-temp")
                                    Spacer()
                                }
                                HStack {
                                    Text("Instagram")
                                        .fontWeight(.bold)
                                        .font(.subheadline)
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundStyle(.green)
                                    Spacer()
                                }
                            }

                            Spacer().frame(height: 30)
                            VStack(spacing: 20) {
                                HStack {
                                    Text("Create an instagram bot.")
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Spacer()
                                }
                            }

                            HStack {
                                Image("logo-temp")
                                Text("Automa")
                                    .font(.caption)

                                Spacer()

                                HStack {
                                    Image(systemName: "heart")
                                        .font(.caption)
                                        .padding(.trailing, -3)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Text("4.3k")
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                }
                            }
                        }
                        .frame(width: 170)
                    }
                }.padding(.leading, 20)
            }
            HStack {
                GroupBox {
                    HStack(spacing: 15) {
                        HStack(alignment: .top) {
                            Image("podcast-temp")
                        }
                        HStack {
                            Text("PodClip")
                                .fontWeight(.bold)
                                .font(.subheadline)
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.green)
                            Spacer()
                        }
                    }
                }
                GroupBox {
                    HStack(spacing: 15) {
                        HStack(alignment: .top) {
                            Image("podcast-temp")
                        }
                        HStack {
                            Text("PodClip")
                                .fontWeight(.bold)
                                .font(.subheadline)
                            Spacer()
                        }
                    }
                }
            }.padding(.horizontal, 20)
            GroupBox {
                HStack(spacing: 15) {
                    HStack(alignment: .top) {
                        Image(systemName: "plus.square.fill")
                            .font(.title)
                            .foregroundStyle(Color(hex: 0x8E8E93))
                    }
                    HStack {
                        Text("Create custom bot")
                            .fontWeight(.bold)
                            .font(.subheadline)
                        Spacer()
                    }
                }

            }.padding(.horizontal, 20)

            Spacer()
        }
    }
}
