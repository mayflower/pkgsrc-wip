# $NetBSD: options.mk,v 1.1 2013/06/12 12:12:09 othyro Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.SDL2_mixer
PKG_SUPPORTED_OPTIONS=	flac fluidsynth modplug static vorbis
PKG_SUGGESTED_OPTIONS+=	flac fluidsynth modplug static vorbis

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mflac)
.include "../../audio/flac/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-music-flac=yes
.else
CONFIGURE_ARGS+=	--enable-music-flac=no
.endif

.if !empty(PKG_OPTIONS:Mfluidsynth)
.include "../../audio/fluidsynth/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-music-midi-fluidsynth=yes
.else
CONFIGURE_ARGS+=	--enable-music-midi-fluidsynth=no
.endif

.if !empty(PKG_OPTIONS:Mmodplug)
.include "../../audio/libmodplug/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-music-mod-modplug=yes
.else
CONFIGURE_ARGS+=	--enable-music-mod-modplug=no
.endif

.if !empty(PKG_OPTIONS:Mstatic)
CONFIGURE_ARGS+=	--enable-static=yes
.else
CONFIGURE_ARGS+=	--enable-static=no
.endif

.if !empty(PKG_OPTIONS:Mvorbis)
.include "../../audio/libvorbis/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-music-ogg=yes
.else
CONFIGURE_ARGS+=	--enable-music-ogg=no
.endif
