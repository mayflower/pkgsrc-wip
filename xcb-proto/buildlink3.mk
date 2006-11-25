# $NetBSD: buildlink3.mk,v 1.1.1.1 2006/11/25 14:32:05 jeremy-c-reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
XCB_PROTO_BUILDLINK3_MK:=	${XCB_PROTO_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	xcb-proto
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxcb-proto}
BUILDLINK_PACKAGES+=	xcb-proto
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}xcb-proto

.if ${XCB_PROTO_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.xcb-proto+=	xcb-proto>=1.0
BUILDLINK_PKGSRCDIR.xcb-proto?=	../../wip/xcb-proto
BUILDLINK_DEPMETHOD.xcb-proto?=	build
.endif	# XCB_PROTO_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
