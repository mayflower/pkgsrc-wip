# $NetBSD$

BUILDLINK_TREE+=	cJSON

.if !defined(CJSON_BUILDLINK3_MK)
CJSON_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.cJSON+=	cJSON>=1.7.13
BUILDLINK_PKGSRCDIR.cJSON?=	../../wip/cJSON
.endif	# CJSON_BUILDLINK3_MK

BUILDLINK_TREE+=	-cJSON
