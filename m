Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E40666EC7C2
	for <lists+nbd@lfdr.de>; Mon, 24 Apr 2023 10:21:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A3FBC2073F; Mon, 24 Apr 2023 08:21:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 24 08:21:11 2023
Old-Return-Path: <chaitanyak@nvidia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6325A2079F
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Apr 2023 08:03:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=3.818 tagged_above=-10000 required=5.3
	tests=[CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id L17EORWWbC8l for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Apr 2023 08:03:50 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .nvidia. - helo: .nam12-dm6-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
X-Greylist: delayed 1973 seconds by postgrey-1.36 at bendel; Mon, 24 Apr 2023 08:03:50 UTC
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12hn2208.outbound.protection.outlook.com [52.100.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1553E20769
	for <nbd@other.debian.org>; Mon, 24 Apr 2023 08:03:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBuYqWmcLnT1PQkSftBw7J/ByxxAYhIOjBkSEj1YiAObagKmqC4XjB7wndhYSqb+r/1/G3Yas96zCS/HxrumXGJ5YgflN0+GZBoeZBOe/sIGZqpszyFsx6lpXtyAjuf4cibNRH6lmAFF8H02xjvFpL+MvGLUXheVVDRUuBFABRBdma94aCHpw4i91ZZJPU5KXWM+LBclP/+kFSwvsEuqlm5GPT/8SelMqUcuo04oOcaLp2iM0sBRvU2QMkqXz3oYV1nS+v7Y4Te4ZoAYIS+fCsBjtXxVig+IkVN3sOg/NfSyI/MfQYmCJg15/JWxxnDK4I22dyuygpQESreIF2+iig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2y5B4LJkWB1SZ6Dsmj69gjrzaWaAMKpviVi0SmwTtX8=;
 b=m7KyDHWxn9YLCm2OOM5rFxBOJYZ4ZqVQ8xTOIPfg1KNxt+D1O9CmUeXPhUaFmg55KL0pbECE4Swzq5JmL1NI/BLVGTtxGKuphg2bOoPg7Fvw+AxEa0ULFeYrfpbCU8cgRbJgERSnMnW28FGRlkqZrwqOXAxre73hn+uqu5F2sXz+rESXYMIvYnTCz/sdXBnCtRENZeGxp9d4Q04d/lQCdp0N5YpghFimrQZiiGEAVplSsG6JW4ECBPen63psWrIrafpyR9mda+FMBPGzAAfGiqMcuZSDJm7pEk3yD8wvszDIOehva2+o34qkqj1lcl3EC5BeIWvzck3wgJ+F8Bbsvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2y5B4LJkWB1SZ6Dsmj69gjrzaWaAMKpviVi0SmwTtX8=;
 b=onnPLDSnRZKuZI0oLMu9FvqhMP5qeTMIy0CuwEYeJEQiK2CESCNzQIevvJJuBjrg+2J2AeqO41t/o5AUMt8slG8ubc5GoWdFEZy+AEaGtrDpbltMGC7xG+m1QLY4jsM/Sap9frhFfV50AtoHglKn7Ee2tvxL29rHyo7Jq0JoPV4pyphpX3ngEczYF6h6cUqZwL1y+1D65K+NlOcW4lLFLxO2gdPKG2zLXw4bXGVS3a7noUw00t45jGfcxN7o/zvZk1JSXmiqlMmBRdc+R9kDKw4SnY57NxoEIKRBpy0sKFGxPa5yGkfgsoakwkZGLRUh+QoYZyYwq9mYRe3qy0nJmQ==
Received: from MW4PR04CA0257.namprd04.prod.outlook.com (2603:10b6:303:88::22)
 by DM4PR12MB6134.namprd12.prod.outlook.com (2603:10b6:8:ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 24 Apr
 2023 07:31:28 +0000
Received: from CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::8f) by MW4PR04CA0257.outlook.office365.com
 (2603:10b6:303:88::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 07:31:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT090.mail.protection.outlook.com (10.13.175.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 07:31:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 24 Apr 2023
 00:31:18 -0700
Received: from dev.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 24 Apr
 2023 00:31:17 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <linux-block@vger.kernel.org>, <linux-bcache@vger.kernel.org>
CC: <axboe@kernel.dk>, <josef@toxicpanda.com>, <minchan@kernel.org>,
	<senozhatsky@chromium.org>, <colyli@suse.de>, <kent.overstreet@gmail.com>,
	<dlemoal@kernel.org>, <kch@nvidia.com>, <johannes.thumshirn@wdc.com>,
	<bvanassche@acm.org>, <vincent.fu@samsung.com>, <akinobu.mita@gmail.com>,
	<shinichiro.kawasaki@wdc.com>, <nbd@other.debian.org>
Subject: [PATCH 4/5] zram: don't clear the flag that is not set
Date: Mon, 24 Apr 2023 00:30:22 -0700
Message-ID: <20230424073023.38935-5-kch@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424073023.38935-1-kch@nvidia.com>
References: <20230424073023.38935-1-kch@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT090:EE_|DM4PR12MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b7afd1-0dec-4e4c-b33f-08db4495eaa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FUTrN3NL9jTniIDY2nTeNKxqQ5P5sJzNv1cM/DieY5r3MqcWkqeXUAQ7Zq+GlNUjQRSDYSeFVnUA00eDyIWLX+/H1sh51cNi0AUheSIkNJa4WXPyrzIFoBZJph+zhhr4HxN9a2U9bHwpGZCjjiOtxzAHhCIsyD+xlS4BMJhTkf7TNgIx9e4bSJG8y6qPBQOooPHYslVetaVStYhchhD0SRVSQbworBnEAAxgLyTtJZ83m9wm6bGoDMwpd/4NyRtvg/DbjeLPL2xY50xBhaIj8mkb6pxb/06TK1WO1kFXcpun4STpaKXgbU6Qr9Sayd8zCiDfAoWL5R0hl3tBJ44BX7JsY9/nIuJsmd3vxWZDMLXJObV/NzVNwcCYQqeWPeVFuPn8DFUiye85Gce1Pek0XMKoB1mV8Y04Rp0LmMkvt/Trom4h696Mggffi3agwwCd1suFYaZcrlCNWvWzjanf8Xn6uL8wnaj7Gu34xNaXIaSuR/S2y2ZRYGCeFxvrRiYleiMcHJcJnYq38A1GVTkDp0rTXD5Xwq3GBWriJYOkZR72QIo0lKgEcBv6LWm6vYCokLUD5DOmyleai8uYR2A/crazfYyvZiLOSksxNARhS+aqYFtVCdUTUiWwCfrZsNzC8T3J+dQggriRxHehqYxD/750goAFP87ljSTvbVjyvaEWV3uG4lbGxTmmUPfff4bPEDzFEQeBH2wSry6/DefTPFgvWpqfGjmvXmAy7NDlW8UMmwF6l3VApss4juCqU2dLF8tZbPNMRaQUNUnFub0R+Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(5400799015)(46966006)(40470700004)(36840700001)(34020700004)(478600001)(6666004)(8936002)(8676002)(316002)(82740400003)(4326008)(70206006)(70586007)(40480700001)(41300700001)(54906003)(110136005)(7636003)(356005)(4744005)(40460700003)(186003)(83380400001)(2906002)(16526019)(1076003)(26005)(426003)(47076005)(336012)(82310400005)(36756003)(36860700001)(5660300002)(2616005)(7696005)(7416002)(12100799030);DIR:OUT;SFP:1501;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 07:31:27.9572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b7afd1-0dec-4e4c-b33f-08db4495eaa6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6134
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DnZuuMa12QE.A.J2E.3vjRkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2444
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230424073023.38935-5-kch@nvidia.com
Resent-Date: Mon, 24 Apr 2023 08:21:11 +0000 (UTC)

QUEUE_FLAG_ADD_RANDOM is not set in zram_add() before we clear it.
There is no point in clearing the flag that is not set.
Remove blk_queue_flag_clear() for QUEUE_FLAG_ADD_RANDOM.

Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
---
 drivers/block/zram/zram_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index aa490da3cef2..f7d4c0d5ad0d 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2323,7 +2323,6 @@ static int zram_add(void)
 	/* zram devices sort of resembles non-rotational disks */
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, zram->disk->queue);
 	blk_queue_flag_set(QUEUE_FLAG_SYNCHRONOUS, zram->disk->queue);
-	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, zram->disk->queue);
 
 	/*
 	 * To ensure that we always get PAGE_SIZE aligned
-- 
2.40.0

