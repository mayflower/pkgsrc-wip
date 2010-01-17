# $NetBSD: buildlink3.mk,v 1.4 2010/01/17 12:03:26 thomasklausner Exp $

BUILDLINK_TREE+=	hs-Lucu

.if !defined(HS_LUCU_BUILDLINK3_MK)
HS_LUCU_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-Lucu+=	hs-Lucu>=0.4
BUILDLINK_ABI_DEPENDS.hs-Lucu?=	hs-Lucu>=0.4nb1
BUILDLINK_PKGSRCDIR.hs-Lucu?=	../../wip/hs-Lucu

.include "../../wip/hs-HsOpenSSL/buildlink3.mk"
.include "../../wip/hs-haskell-src/buildlink3.mk"
.include "../../wip/hs-dataenc/buildlink3.mk"
.include "../../wip/hs-hxt/buildlink3.mk"
.include "../../wip/hs-mtl/buildlink3.mk"
.include "../../wip/hs-network/buildlink3.mk"
.include "../../wip/hs-stm/buildlink3.mk"
.include "../../wip/hs-time/buildlink3.mk"
.include "../../wip/hs-zlib/buildlink3.mk"
.endif	# HS_LUCU_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-Lucu
