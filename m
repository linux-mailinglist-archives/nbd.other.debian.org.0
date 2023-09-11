Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC3179A6D2
	for <lists+nbd@lfdr.de>; Mon, 11 Sep 2023 11:42:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2A2062051B; Mon, 11 Sep 2023 09:42:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 11 09:42:21 2023
Old-Return-Path: <prvs=611cf258d=shinichiro.kawasaki@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SARE_MSGID_LONG45,
	SARE_MSGID_LONG50 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E25B6204D9
	for <lists-other-nbd@bendel.debian.org>; Mon, 11 Sep 2023 09:24:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.881 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id sz7p7wBsc0RM for <lists-other-nbd@bendel.debian.org>;
	Mon, 11 Sep 2023 09:24:19 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 439 seconds by postgrey-1.36 at bendel; Mon, 11 Sep 2023 09:24:19 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0640F204D0
	for <nbd@other.debian.org>; Mon, 11 Sep 2023 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1694424259; x=1725960259;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=Wq0KDj24FkzKEJ5BkEvSbpSZ4x/2B2eI5RBObpnwle4=;
  b=R4l3qUURT561m47K4NxRYq2T3zk2MYTBRV+Qwwucxc7xgNO1+mnWEd/n
   mjmjhqMjT8YgN62j5tGb3E6Yg3ESSbH5n5rjFrqTtHqCBLX+pL4lWW13G
   M6IPTFzvsEI0l1VZHlLtaV6L5FQA1YvUo2NPy5qylIyvAWfSTqrRDL7oa
   bUPHDX1ja/nwKYsd3CvZuRCfnPg/llnaBlCVxHwZrWlheL4TAb3nfPEQ8
   Qi+cmkuE+GufQh6vpcCk/CswFap0T8kX+0m9ELoRy8W2MozF3oG293IGU
   AgrQalix4vusYVE1A9/KAVvOjvsdhWRMyAZzpsgMHAxIOhZiVQXs+k9PP
   w==;
X-CSE-ConnectionGUID: 86QGxuYDRDupvLI/cwb0yQ==
X-CSE-MsgGUID: EEHlWox3RZaVOHnSjhsstQ==
X-IronPort-AV: E=Sophos;i="6.02,243,1688400000"; 
   d="scan'208";a="355667959"
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
  by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2023 17:16:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWXsgze00BQSwZIA1Ej1z1h0fv5bnxHdHc5VXO5UmqTpJ+NdwV8QFbduWrnzCxvlYW/+U1NMYe7DjZob7SnYetdmtuWGaKSO6wdVWmyt7rU9eNQe4x80cMWWNEgf/FBNAzYbg2G8axuIaLoBbU/MkyYt3LQzmROtw8Z1Ari38P6uzCuWKx3se4djIc4qrAJ0HxBdvS+Yu4uSDzAffEseJmOygmGpBnBO2UO6FfeV+lI/P4igB6fkTEALMJM25Y8AY5SPeDiuwK++KNAFDUQHyKKLu7EewQcb2zeU9s8J4e2q863WjCxijYLdemBM9ZOdHfM+VHOTfDpssP0lWRFptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7Zg9y280bo2AMrXibjAVs0VrIOZwkNTtKediLPcIEk=;
 b=BpFtee4pASIkzyEV+JlrnPHxE+KevLzcyULJa8EcAcsRYwZxC+LHODm2PgQ3NJkZAPtUhrJeY/GoYgZUV+qqKIFSMMntlsGCZFy5CI9J+eZLoh98vWOayXZfIapK6Z6klNNcA8mKG2GqBNA+nD7dKU/sXOFvMXr99sGG7s5KlJiu+iSNChZTLzQRr2cXC1YQ5vkMZjSpUf+QZxsidtSVB33WaNmpZNxxV6k9nS9BWF7aYAkSPtRDcuPwSGwaY/RHRJsc0XypconitueR5WWSc2K5LncD0gmlC6izUCnqJDIebvRDLpzTwNl2KNCNwrCv7wELNFLx5m7O3ZSbnOzv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7Zg9y280bo2AMrXibjAVs0VrIOZwkNTtKediLPcIEk=;
 b=wtIOxdHMnxlXS/mVx+MWOceS8XcIMmQegzEFhoVugix4Nj9mUwyTgDtp18s3TqGvB0tezKVjNKVdvGHPZ3NrCGd7wSRIpu04vD4rRoYE2vsxrIAn4b6fLF/NBt27BjESovdrh7uCOjdib9SjhxGxnGZPxtUOB+FnLNxVDJs+Ixc=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 SA2PR04MB7482.namprd04.prod.outlook.com (2603:10b6:806:14e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.14; Mon, 11 Sep 2023 09:16:52 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::f92a:6d40:fe94:34e9]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::f92a:6d40:fe94:34e9%7]) with mapi id 15.20.6792.016; Mon, 11 Sep 2023
 09:16:52 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>
CC: Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [bug report] blktests nbd/002 failure
Thread-Topic: [bug report] blktests nbd/002 failure
Thread-Index: AQHZ5JCzc6J135fBEEeFCkPNl2xXjQ==
Date: Mon, 11 Sep 2023 09:16:52 +0000
Message-ID: <jvlrypdkye74nea4iys2akwfyvskvpw4x3a2zewwxx3qde22rj@jykkoadmb2m5>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|SA2PR04MB7482:EE_
x-ms-office365-filtering-correlation-id: 68d22d8d-df96-42af-f852-08dbb2a7d619
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ytBv2ohIgRFzL1p5vTpe1yNqebp1fvEExaQNtWalsPiJD3slbYQa7rUQP5AUa+3C4qsc8vHE2r6SPkVUV1tNxkChcjaSDjmZGWEPuZ/NU8B5qFw/wcpfbcw1r5ePHS98Gac/yvsdc52PCMrGcZfPOJFMrI0HdSwbypSpixthV8yHwDU5DjUXZVpfF4qjDMIYYMDEn8VjIcptCpbzXMFWWQSmZEJJYePK7MeKw3lXF+I0u0gTTubsLKWG1cCVGy2Xfq35vLTU207q2z/ZEHCEdauod11IImIWY/voF/+sO4qvLUqfl8unBgEDhypy7IX1sfXUGuLBNpjFXWYpOR/+iJQpzzn/ZCdlQxAUpbZP0hpi2czdE1oQC55iudQDG+Jk3FdSBxHtyzV357+kVf8udMywQWV2rIgcLYtcNc+ZMh89uSTDWH6WZHMCqwLVO4iG1jOlISa5tg7+dpCuxy2RSKfqK2StHR/pIbgvOqT7Eo8BWPrz/jdQlHxuEz8Bn8+otUrGMxO2Ih1fIIWeijxPLNaSuPlzhxOBZyQVkRZwcSkgSgeCpU7R5hMtqFm2fKzywd1RuK2Ad77DnLHRCdEbdAakRtQM35qUchynHqJrTxQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(136003)(346002)(366004)(376002)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(71200400001)(9686003)(6512007)(966005)(478600001)(83380400001)(2906002)(26005)(33716001)(44832011)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(316002)(76116006)(91956017)(110136005)(5660300002)(4326008)(8676002)(8936002)(82960400001)(86362001)(38070700005)(38100700002)(122000001)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FUUH2QIdXqvT6sjiR0MXvGkmR1dvukEjubMYisp4dc4/lurvQgWH/lyjmUqS?=
 =?us-ascii?Q?PUpg1tDnXPoC3eKHVeiAIouAx4bNtSx1Xv2vjtMqlVrBtRtUgPuCMBSVZKK/?=
 =?us-ascii?Q?RiHciivJ3XkwgWn+lYaQiTdpVkERzIPJxRuve+XK9eS581zzYFa26gUccM1+?=
 =?us-ascii?Q?zt2NDeZ7QtBnRsEGqLVJPpfsVDlwoDdnESfURHZXOVEioHSne6CoiNBfsQwb?=
 =?us-ascii?Q?txKxL0w0te5t82KZEAlfa/xtaTGOOTNpcadm7O6EA8nu1elzV+s7maetWCcY?=
 =?us-ascii?Q?cmic8rHaCURBOcfZOwMachbgcE7wcZ2MvxC4Djlrlr65ASgjgn3SJ6JOs2N7?=
 =?us-ascii?Q?cBttqpIjuO5jbYoa/WN9W+m9PQV8827gCPyFOHyrZO8ZF/EmtArQaeewxiE/?=
 =?us-ascii?Q?YHR6+rgf5bIAuxlMm25YUNNtrSsctD7o8zo7RwVqO/UQSEERE7YSb/sJmEbf?=
 =?us-ascii?Q?Fh4HCVTQDcE9Bm+YwjjRqIn9hGQWOIRdLS0QewN+szhaFp3V5x17zqikf0t+?=
 =?us-ascii?Q?L/4DC4v07fMhbryKflSSa1UESr/OD75n2Qoyo3PAyIGecK/Vfs+amX1RTIhg?=
 =?us-ascii?Q?3jxHkvQMP5Y/2ncXlIwUjzk5Hx+EsenzoD9W8T+lWv1rARWOsidN09HRTJX3?=
 =?us-ascii?Q?gKeI8R93wx2H9Jp+9oIi7+Kncs/iKMVZSl6E/65Mo3OnSGM9wZDbumGZModL?=
 =?us-ascii?Q?R7FHeajBenN8WEBRrgov5iP4GPL0QkyI57A/wXdkITkGYclUNnLhHBKVfZA/?=
 =?us-ascii?Q?D67v+XeE+gsxbWfC3pkMoiZQme2OGpBHVtXnd2rKQYtCo364R9wAhSkjr8Aw?=
 =?us-ascii?Q?fPABtDVIggPsqvu++uuiq/cLLhvoYrZD+nZGc3H3xFJSARl7TKzAJ1PK2B6x?=
 =?us-ascii?Q?zzDwIBQ0QfHFo1RgePtVodYlmmPDfPkAqv89z876w14mPEQbDCZgHmNlR6+Z?=
 =?us-ascii?Q?W4QeX6P8Crz/D7S120Z5glirIjawriYPoZSBRGZs/P21nOSD4F4lyjnSdbvI?=
 =?us-ascii?Q?BZE8E31TzuxiwwkJkGm7h9uj+KfjM4DVQ6qMJHghlQVsskhae+HriNV7CScl?=
 =?us-ascii?Q?dGPamp9mme+vSyHuMKS2bJKvQDTw/7zxcpUJqnwSYqW91OuPOh7NDA/EWkYL?=
 =?us-ascii?Q?Bx28QwhOR5h8I9WxB5E+JRbYKmWbt8GOy6MJSq3mw3nTq3p3fsAwi9+9SH0m?=
 =?us-ascii?Q?OiVCRdc+6LPAUgIwRhpfat5kdH9ieWmLUOQkS8b5tNtJsaaeEssoYOWJe4D2?=
 =?us-ascii?Q?K9IoZc4fzS04dK4b1PsUbcU/VrlKw63P2W8I1pRb7KgRSd4+N7yiNGF/ZUpA?=
 =?us-ascii?Q?a+DkGKaTR3KqHu8XKK36BR+bvjhtHQIlHz0GPcIGxELjekONEt3XC9yABp0/?=
 =?us-ascii?Q?Il6azklrxCfZUuYlQAQ/F7iv9x5ml2+VryBRTfBbw41qyO31D1ZY3e+XpToS?=
 =?us-ascii?Q?zCV5PRbYQwfDzhVOi+trNtU6iaX/JyzphGrIBEi2l9zaH94FLqlBFI8h6kzy?=
 =?us-ascii?Q?wHgV7ImJe3TZx5d31WysXU79vYzjtCbqAWLBUFn9GgSRp6meFXyL3WLK7DpC?=
 =?us-ascii?Q?db+Ei2/lq0yL6/t7cc2ZqL+HDcC0kcOz89tyBJjBu1GPrAlg/Z6eOzrp8vJO?=
 =?us-ascii?Q?MsvsIFZV3x2+SWixP0CarnA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <49CB0EE8A08FCD428C3AD979921B86FC@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a0WuyyMWwfM+b13/lMJKl5h2TdS9MRq3QDEGyCxNbTFm0jC+4EkS22bjPwheCgi1mBlvLEzzyuwik41DB6G+hWryIEo94XdHILLkprkMAszPYoLAtVUWeG46b2abtLgpcBMjkv/gSk3yEwZsEE6ZyeGULBsMz7yUyfqxhEAszyh6B3+HIT6aa6Uc2NrjrNhfTQZA1jJBCclmi9nb5nuviU9P5MvTEgaO2zo3uJWPA6QfMNA+7reG6598EM4DsaA8Waey+x3KtQdYjmLYQM7JSKVzDmC0N5twusnxk0fkEtbvZ73l/pawNYnNFTIjd4SfW0divZMY5dMJcoN19hcbRcBH1ZTTOgaLY9McV7EwK/rV28542tRYJ6jMAePkGeUFgUN0o0rXhFTmRYFUm5VaR+po5LVGzqLNnbnMiwVAp8CeS9XIg7fuib46wNxHZ14NEje7AXtCB0CHuqolUKnll4RhdHtl8+uOpo0gSEopfpeKcI9mAm7yi2gYZt84ngCaf5UclLFwgchGmt7LcYwD2ofh2MO/WXFnGhqKh40dylBlpemHWUdicKD2VGZpl33/0CvVd3XPwRvXFlL+VgJquXqpbGCd9WrmLxzjS9jQYQQUR86Sd/tq5U72ZMg+UPAdnIa8zJxqI2rQvvYXGpPi0W4bCe3s0K496a4skti7wU2oQEcPiulTxtsifw62/VyBBBAPKyIVba81MZbaLfkj0QTmC1VZMrMWruZhenpbO7GgHuiInqTOJJkTdc62k02VTMmhxzelN5TzClxayL/EFQeEb3m01g6AOsXWTladqcA7Yl+VDv8GhTZk6KGZg3a7eUMXuoRRyOj3O1jALbYM21hMlBb7/wontvOHHHVG5XYur5Xyp2l5qgFq5HQZD7LXHNlA5bSqcFWhUjjO55IqrzEJhzevAb4meoPRFdAvYyI=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d22d8d-df96-42af-f852-08dbb2a7d619
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2023 09:16:52.4142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aZ4hyV/hieB+6P9y3Se+qjraNhuAXJRoO+lu5ONPjYWcHvW4ENuzpZCUHu3d7BN1veLyjixsHQ1MjWzILrQX7P1m4ZMYRnDN4hnJOZ4cjhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7482
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dat4J2mbFBE.A.wQ.9Du_kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2634
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/jvlrypdkye74nea4iys2akwfyvskvpw4x3a2zewwxx3qde22rj@jykkoadmb2m5
Resent-Date: Mon, 11 Sep 2023 09:42:21 +0000 (UTC)

I ran blktests with v6.6-rc1 kernel and observed the test case nbd/002 fail=
ed
with the message below. The failure is recreated 100% by running the test c=
ase.

---
nbd/002 (tests on partition handling for an nbd device)      [failed]
    runtime  1.620s  ...  0.369s
    --- tests/nbd/002.out       2023-04-06 10:11:07.923670528 +0900
    +++ /home/shin/Blktests/blktests/results/nodev/nbd/002.out.bad      202=
3-09-11 12:03:30.901246261 +0900
    @@ -1,4 +1,3 @@
     Running nbd/002
     Testing IOCTL path
    -Testing the netlink path
    -Test complete
    +Didn't have partition on ioctl path
---

I checked nbd changes in v6.6-rc1 and found the commit 0c1c9a27ce90 ("nbd: =
call
blk_mark_disk_dead in nbd_clear_sock_ioctl") [1] is the trigger. I think th=
e
test case expects partitions on nbd devices are kept after nbd disconnect a=
nd
reconnect. On the other hand, the trigger commit looks removing the partiti=
ons
after nbd disconnect and reconnect. I'm not sure whether of the test case o=
r the
kernel should be fixed.

[1] https://lore.kernel.org/linux-block/20230811100828.1897174-8-hch@lst.de=
/=

