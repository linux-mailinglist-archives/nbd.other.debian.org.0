Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH9GKc+J4GnFjQAAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Thu, 16 Apr 2026 09:03:43 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1EF40ADA6
	for <lists+nbd@lfdr.de>; Thu, 16 Apr 2026 09:03:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ED51D204AA; Thu, 16 Apr 2026 07:03:37 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr 16 07:03:37 2026
Old-Return-Path: <prvs=559decb09=shinichiro.kawasaki@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FVGT_m_MULTI_ODD,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BD1DC20488
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Apr 2026 06:47:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.378 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id W3lB8Qx1hJSo for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Apr 2026 06:47:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 445 seconds by postgrey-1.36 at bendel; Thu, 16 Apr 2026 06:47:25 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 93D9520486
	for <nbd@other.debian.org>; Thu, 16 Apr 2026 06:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1776322045; x=1807858045;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=sOvftSr8hvESe+OZLhfAEkKTr0PNxfBKAtJaDMaYZFk=;
  b=MhgyyRN4/nfG/YFCi7zCboBbPMZZcj7Jv3UWfWX5F/4Iwl2ml6T0OkG1
   UJ0ucf/D089JgYRnm9AlBqvzmgHqXRLrjQj2ZDGve6F36/7YBIK8Dbjdc
   aId+DdPMW2LzuF4EPsZgMOEdOWAXFV57efwzewoy9v6usyHPcJnmIQBxN
   oSOVOqc7DKSpVknkykJWIxrKQ/GJDOXWE4dCxg5UYcW1nolIc64Ro7Sat
   TeR4/+KRYoAW+zfv4SDQMTD5USzb1RSGl4QRZYqDzw/YGQHtU/zrnb4/j
   f3Fpy3rvsSfmB6OA1NcMBPAcZUkkZrkuBnjmpg3IeckAz/m9/fMES3e3m
   A==;
X-CSE-ConnectionGUID: LHL2HxsETp+qcULeUvA4jA==
X-CSE-MsgGUID: vW/298JSQ0W27olEU279Qg==
X-IronPort-AV: E=Sophos;i="6.23,181,1770566400"; 
   d="scan'208";a="144619434"
Received: from mail-westus3azon11010025.outbound.protection.outlook.com (HELO PH7PR06CU001.outbound.protection.outlook.com) ([52.101.201.25])
  by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Apr 2026 14:39:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkzBJTX8z1c7P7Hu9or5km6aT0y3LWsBLuLFe10Ah9SuSMyJsSs5O635eWiP2RPXLmr1yHDFwqWHyTvZ+nkp+GbFO8/u/AHUFDRq4VlgxD0z54AKkezY4C/iYJGHhV+fx4OIvC0CRE2yYPtT6g5nRITbnF9d/KW/tkBXqjTkbyy1qZgT14TffNHs6hsluvs9U47pKCbiiOhvaLC9pmWF/iIO/+TctQnIPfgZY0njvuInkW8d/7GuOtyhqrOKjFUbCl/vc4n/dlGi3isKpXYoGPEqCZ6U+LGcCcAYtHIU+nb9SiG1XauFwR6Jxmax27l4a7FVnKstYdb0IhK4f2SVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCWykaewaOkU0KsQqQMBxaI/9URgKBC3eTUp7msqMLg=;
 b=n0Db2OX5qTRcr8UlxmOWwzJtoQUhCsm5BK8/JjEmjdO+rbOeQhVjOhMDsGblXaQni7u6QmV3bUGanyrMrgBOab5KRiCVuM9I6oqoqbtGkm6Ur+S5mAI7vGE773twThiznggjkbcmbqHROsWpSePGswKu425QLpmJci3ASXb/ww+mC3HAObnVzLbmzi1O4OtP92Iq6svtD7DxssLYW9DO/bIbStu1b+2msLOtcZTxrrKLvZiJavf8Lwr+69oVXCK+631GZUwsYj2Gsz66NufwZOhVCjpdLpUcrHgfwr+kR73YMwq0E2VXLRbje+1fIywTSrcSc//vAlVbaJnCyvWicg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCWykaewaOkU0KsQqQMBxaI/9URgKBC3eTUp7msqMLg=;
 b=XdXswdwmcg8WiOXtKDRbtd4bWfgbWVhZM+GBEnQI09uRkqlGj41qEFRVjnsN1RhRbDbn9Rm+/3KFFMeP+YBuby/d0dTWUhLxmIZjBFVSho60Wi23OrS4aV9tkTiuOozWawE1AsTxOq234A/sDusAelmoRN/39R2GWr4kja3/imA=
Received: from SN7PR04MB8532.namprd04.prod.outlook.com (2603:10b6:806:350::6)
 by MW6PR04MB8881.namprd04.prod.outlook.com (2603:10b6:303:247::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 06:39:53 +0000
Received: from SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::ce42:7775:2df8:8729]) by SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::ce42:7775:2df8:8729%6]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 06:39:53 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org"
	<linux-rdma@vger.kernel.org>
Subject: blktests failures with v7.0 kernel
Thread-Topic: blktests failures with v7.0 kernel
Thread-Index: AQHczWvUD0+ZsAHQ0U2NzyLBL90meg==
Date: Thu, 16 Apr 2026 06:39:52 +0000
Message-ID: <aeCDXI5hY_ivSWm4@shinmob>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR04MB8532:EE_|MW6PR04MB8881:EE_
x-ms-office365-filtering-correlation-id: 5ed0ed28-6aa4-44af-5613-08de9b82f752
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 he9WO0Th9lo/PPQORPlxK/VWPNSmOcX+eNGaw+tHEjM93fw3cGsvF0LD34sSiI31mOeUDYQkqI+EYQJp/FBHVtWEIcKX3bIIo4eDgvnS/3Tt0kWDGmB+59Scnrzh1axkpnmfbzyTajkLD3QmrT1y6kIgc3O10mIZ+ITL6AwKqFdFnZBUs+4XaONP0cNrbgR4monDNq2lx3HVWze+WvpFe4k7gLCvXR5oHsznaX43yZya6TPuQamOOxmA6DPfe4dyketS/NVsoKAFlGVl+k/7wGPUxVvwDP+EWSPZbSC896JjbUYfXZVVIJAX7fDBqfZb7N1r0JGCkuDKd7J4cx9KO/slq4uRI+z4wyXcM4n24F3KYDxrhauDpJCPiNk8bz0isW7WxFv2N63JxIiNc/ZqBaSnLe/sZG5uXft2w+taLoBJPfKbNBSHdjttAmo0nj2ImUTjk2qVqReUcIdDTxRkk6PGFeBezIUw6Px3HrpOC8woRUaSG50/MbwbK5Y8YallDGfo/rblCYSnpZfRJCa26kCXDHdu/rlS7yMqASB54PJ4qgxxD5M5gOlEbVdeCKSTf7yN7FIWvB7RapNCuAzTve/+hmRvnL1Cqe725iX9HDQBdgWAtkYB3B9WskkmnVjn/6H1J0cm1Aw3ZZeQ/Sh2SWN1TpGyPYyvzwiUBNqK9FaUnLSKgLV7Xhzo3/GTeph28AaN28jpleJsoOShGQMkOhPBA9ycS6yn9Ay5T4Kl5d/iq6GXoMS9GBufp25okWNGMbFoy60q4GHBbOx76QZ2pbskFwtEU2B9cBl9YcaxbJs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR04MB8532.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?C0DCqlki0Sd7VDbiumcY7uto15AAZUKblHnT9icr6PZN4YH5WGi4MWzh+5Sm?=
 =?us-ascii?Q?xrgkvSZrDeCPGaNmsqE1Itq5ZIX06fDsBkaP1gZh5gVXc2owmaMrAWm8UE5U?=
 =?us-ascii?Q?3XDcofrBdWqtd7xVsyMAoVgQ8CmorkRvFsUNkVaOKQhHVUyXms0eWjV2a0w8?=
 =?us-ascii?Q?p47m+Zcfj2oYbPWzc1+LvyngyLa7BR/OMjEWpbAvHiGqNMX0JiZcL/94bK73?=
 =?us-ascii?Q?QCEspe4EMtK6pFsI4WaCc1pl7GGFMQyJD8X9FxcuywCyLVJA9IsiZoctVwsE?=
 =?us-ascii?Q?PiasT4GT7xH62UuqSRCdfiYVmv+pRoAdLdGn/h6o0yKQAj/mj6tU7gVxFVWe?=
 =?us-ascii?Q?cPg/gL/wRxRM6NkbUELguyyfgKkZAFQg86GoU1CgULuPToOLB/qHKCpXe9Sz?=
 =?us-ascii?Q?ztbT4Qb4spyXSPQSxl/CDIf1njEYuF2JlyLeGwPObtyEI9/qY/WMQNnCZCZl?=
 =?us-ascii?Q?MZw9uXULRJjJyoxZ6Y4QRd9lWHZzIhMJnWjNxYeX+5VejdLf7cPT3WseuBSA?=
 =?us-ascii?Q?jPPE6lvQuABm5Q/6hWnzgOrgYPx0mpCFGR3a/wZXTDvZkGdfqvEopajcrTp7?=
 =?us-ascii?Q?X6/3xCOhEWirz8vc7wOmHQdOvx6BigGLpobUqKcy8ApuoeHj9OgERXDr0dMy?=
 =?us-ascii?Q?MPV6FXrnRBazt6gsB7BJf2OODwrYK+jG4Ephx4WQXB3+92ha+mrYF77oxq6C?=
 =?us-ascii?Q?tuBwwmoxz128vytqEmnmxnIU6SJKp2AeRdzR0Dexq+6DckyqCkvp8nyEeWNq?=
 =?us-ascii?Q?+QgPhNyKLU2DWxamPqQJpCmYf9jj5pzWlpaq+XXceAR4cLavSAR1HPSv1q9c?=
 =?us-ascii?Q?L6lxqxM0G2PY2YFh+4ZeRfjkM9w+GWy5Bp9/q9xljTG4I9ZcMrsqjLEPCNEn?=
 =?us-ascii?Q?DuUELZHWQIoxFCG3RX1m2Lh3e2ot7CZMcVgCVdNT8CZtaLXgVyMmb2C5a4XZ?=
 =?us-ascii?Q?h/GXyWAAd940Kqn7j1JPgR4rs7fDYSzf9LfsYA2KMRXV/5t1DKBTX6uTqPoy?=
 =?us-ascii?Q?uAluj86YvpGUCkhTLws0j3fUFHUyPOd+C4cak4MoZMw5Uwqn6VWFrRdociRo?=
 =?us-ascii?Q?qprnLX7I9kvPGurOdG4erlcQIaSWB9vjBM10+LSsYAGQbzUAEwsDpX+BV3zJ?=
 =?us-ascii?Q?y+47ctbYEf8oMrHUenz4GP+j8txfWk53EzxylbaYYZzfRgHuAee9aYVbT2Vn?=
 =?us-ascii?Q?jpFI2LFRsvfCt/h6GaUshQZ3TDV5OVSStXbaQTRMil6ltFHkZl5OYehQ4Hgf?=
 =?us-ascii?Q?Z1afB61BPdeiT39Cnrq/AA0BFRdsyGrrXg7Xf+gwWh1Luc/A3iH2T147mZ/d?=
 =?us-ascii?Q?JpKQro3yTJpmLSl/AsTGyKE9T2W3TifFTgjIFbrtArs3GvvT0Ras1WgyjJUG?=
 =?us-ascii?Q?lUUlQ3FgEul0WjchjXVQaufJzIr42ZpRawXizg7CXGTsF+Whl4pvJh8sgduL?=
 =?us-ascii?Q?ztq31C8IeFs3M9ud9mNIAZq3BRZS3mVmV610YaKaBsQ8gWdYX3HnwlnAYcmX?=
 =?us-ascii?Q?66CIQo90bdF0GWDpqd/hFy8VYP4SD3DlUNnmhQ4tcNYaEQTBqcs4errtHZU/?=
 =?us-ascii?Q?SQ+E59M0iQZ2DAEQLGRmaVRRMCAhlW57MIR3sfm6HsRhnhslok3RZaL4tIfv?=
 =?us-ascii?Q?rBWBegPUlm0cE/asaIVzHHpxzEtNyYCkCKq6q+fmGW69afRrLX0n7cAjUJ1H?=
 =?us-ascii?Q?OUlqbWNRwleCaq1KmrEx63kUG+AFolTwk97UVGZ38+spaMr7rELRPO824Tsp?=
 =?us-ascii?Q?R6k+0WjumojTXiFdClbcDnt3UAf9Mqo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E638F93FBBCD1D468AB7D16F0D8DAD62@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	cZGRS/cBdSR0Il4+u8HXpUp0Siw46acA53/1nMcaFbY77GmmQKRze1dArZ+xoVvUuRIxOQol8/Z8ehTqgEfLL/l6LjvxpQVnHTlOCrC2uMp7+vrIYW/HEHjNZyK57FiLHjIZdId0KT4PmE4CaAqOO5ox2bdgsWYiHqUKHUFLkauht0jFny5Vbm27QBu9WXSBKZ8T2hsUtGUIeS3HmDznxsa5GaKs8boX0ENq7gueIuM1Um0HU1wm1JyCv6STZh6aHdgkkXc4TylZx6LrlJtHuwCxzj9X97i2ns/qc1ay7/Ygdm1U06IDlpB4v5r9zZ7pEB4lqYh++AjvDLWyAueVew==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ewdmFDx8BQud4q1UOiGC1ooy9ND4c5ZdFeejEpTO+NQ0LTJnsYAZ6bVUBnxHGXmtRNFA0RCcN850eB6o5onrRTFYQ3pfBM+VFmoWLj8zG15FPtc9M+qhVpPAiITVpFM7Ezn3yuDfzpbP7SCzV8LiRDvqXSee/iWnLMsvUe2/UQIUpT+yujiCGikPy5BwizpHoXqor5VIOKTCHaevR1BVRydyZk1J2/RhSS3JQ9NTDyEFNYgOfrJG0Y0S9MwpMXujDfjRYkrQ5CfiBzWY+dqUe9NhAWcS0K8JauGveEvkTWe2hd3Hts3nh7/ytkbWhEZU/aw4Jqrr51uRNAaK7CSdswIpzrMeHmq0rfml+Di3aPgV4Z8vCPr22jmKHpGfRqWeOQSWcmCIgslPLlyP5Q0V5PwEVY6ndTbS+XOKCUPLMc20LWICPlsDi+TXwy7Mb3+ZamhRnahX604nXb4LOf+IjIrk4s8FT/lKls7QeMkkcLtnnTbSxNBkoP89A/DMVafa4bmswV4pMdjB4KJlRaCj2f6XIoje3rLN7RujREUjskzJIdlDfR6fwFqhe7S8d+/VjnBcOEJ+lo7W5Jbqcz2vZlrU6wBZJE2BdO6ShqnYoG9cHa3m8mOBk0vVzPQUSMER
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR04MB8532.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed0ed28-6aa4-44af-5613-08de9b82f752
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 06:39:53.0189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4n6l/UC8dS8Z0hRHyJSfUgsVL4UWmZrcT2qXlJLasuDUlrRcp8v93GrO/Z+mr4R7JEQu/NRq7q8MSm9EAyDxL0lkPjT/zoNubH+AvYfqweY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR04MB8881
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <S04Q_hyp-iE.A.p3pI.JnI4pB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3534
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aeCDXI5hY_ivSWm4@shinmob
Resent-Date: Thu, 16 Apr 2026 07:03:37 +0000 (UTC)
X-Spamd-Result: default: False [-1.61 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[wdc.com,quarantine];
	R_DKIM_ALLOW(-0.20)[wdc.com:s=dkim.wdc.com,sharedspace.onmicrosoft.com:s=selector2-sharedspace-onmicrosoft-com];
	MAILLIST(-0.20)[generic];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-block@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,m:nbd@other.debian.org,m:linux-rdma@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[shinichiro.kawasaki@wdc.com,bounce-nbd=lists@other.debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[100.75.195.82.asn.rspamd.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	R_SPF_NA(0.00)[no SPF record];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[shinichiro.kawasaki@wdc.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[nbd];
	DKIM_TRACE(0.00)[wdc.com:+,sharedspace.onmicrosoft.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:helo,bendel.debian.org:rdns,sharedspace.onmicrosoft.com:dkim,wdc.com:dkim]
X-Rspamd-Queue-Id: 2C1EF40ADA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

I ran the latest blktests (git hash: 255189f0c4e5) with the v7.0 kernel. I
observed 6 failures listed below. Comparing with the previous report for th=
e
v7.0-rc1 kernel [1], 2 failure were resolved (blktrace/002, zbd/009) and th=
e
hangs at nvme/058 and nvme/061 are no longer observed. Thank you very much =
for
the fixes.

[1] https://lore.kernel.org/linux-block/aZ_-cH8euZLySxdD@shinmob/


List of failures
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#1: nvme/005,063 (tcp transport)
#2: nvme/058 (fc transport)(kmemleak)
#3: nvme/060
#4: nvme/061 (rdma transport, siw driver)(kmemleak)
#5: nvme/061 (fc transport)
#6: nbd/002


Failure description
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

#1: nvme/005,063 (tcp transport)

    The test case nvme/005 and 063 fail for tcp transport due to the lockde=
p
    WARN related to the three locks q->q_usage_counter, q->elevator_lock an=
d
    set->srcu. Refer to the nvme/063 failure report for v6.16-rc1 kernel [2=
].

    [2] https://lore.kernel.org/linux-block/4fdm37so3o4xricdgfosgmohn63aa7w=
j3ua4e5vpihoamwg3ui@fq42f5q5t5ic/

#2: nvme/058 (fc transport)(kmemleak)

    When the test case nvme/058 is repeated for fc transport several times =
on
    the kernel with CONFIG_DEBUG_KMEMLEAK enabled, it fails with kmemleak
    messages. Refer to the report for v7.0-rc1 [1]. This test case had hang=
ed
    with v7.0-rc1 kernel. The hang is no longer observed, but still kmemlea=
k is
    observed.

#3: nvme/060 (rdma transport)

    When the test case is repeated for rdma transports around 50 times, the=
 test
    case fails. There are two failure symptoms. Both symptoms does not look
    kernel side problems, but blktests side problems. I will allocate time =
to
    look into them.

  [symptom 1]
  nvme/060 (tr=3Drdma) (test nvme fabrics target reset)          [failed]
      runtime    ...  87.444s
      --- tests/nvme/060.out      2026-02-20 12:15:11.066947841 +0000
      +++ /home/fedora/blktests/results/nodev_tr_rdma/nvme/060.out.bad    2=
026-02-20 15:06:44.552705787 +0000
      @@ -1,2 +1,3 @@
       Running nvme/060
      +FAIL: nvme connect return error code
       Test complete

  [symptom 2]
  nvme/060 (tr=3Drdma) (test nvme fabrics target reset)          [failed]
      runtime    ...  22.545s
      --- tests/nvme/060.out      2025-08-26 21:28:52.798847739 +0900
      +++ /home/shin/Blktests/blktests/results/nodev_tr_rdma/nvme/060.out.b=
ad     2026-02-26 15:20:36.973686247 +0900
      @@ -1,2 +1,3 @@
       Running nvme/060
      +_: line 1: /sys/kernel/debug/nvmet/blktests-subsystem-1/ctrl1/state:=
 No such file or directory
       Test complete

#4: nvme/061 (rdma transport, siw driver)(kmemleak)

    When the test case nvme/061 is repeated twice for the rdma transport an=
d the
    siw driver on the kernel v6.19 with CONFIG_DEBUG_KMEMLEAK enabled, it f=
ails
    with a kmemleak message. Refer to the nvme/061 failure report for v6.19
    kernel [3].

    [3] https://lore.kernel.org/linux-block/aY7ZBfMjVIhe_wh3@shinmob/

#5: nvme/061 (fc transport)

    When the test case nvme/061 is repeated around 50 times for the fc
    transport, the test process fails after Oops and KASAN null-ptr-deref. =
It
    had hanged with v7.0-rc1 kernel, but it does not hang with v7.0 kernel =
:)
    Further debug is required for the Oops and KASAN. Refer to the kernel
    report for v6.19 kernel [1].

#6: nbd/002

    The test case nbd/002 fails due to the lockdep WARN related to
    mm->mmap_lock, sk_lock-AF_INET6 and fs_reclaim. Refer to the nbd/002 fa=
ilure
    report for v6.18-rc1 kernel [4].

    [4] https://lore.kernel.org/linux-block/ynmi72x5wt5ooljjafebhcarit3pvu6=
axkslqenikb2p5txe57@ldytqa2t4i2x/=

