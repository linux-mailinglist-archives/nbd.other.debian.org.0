Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOgPAnQ7EGqeVAYAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Fri, 22 May 2026 13:18:12 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 928AC5B2DB3
	for <lists+nbd@lfdr.de>; Fri, 22 May 2026 13:18:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 68DF020A5C; Fri, 22 May 2026 11:18:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 22 11:18:11 2026
Old-Return-Path: <prvs=595afed1a=shinichiro.kawasaki@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C11AB2094A
	for <lists-other-nbd@bendel.debian.org>; Fri, 22 May 2026 11:01:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.5 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OqCGK9ZuEsxN for <lists-other-nbd@bendel.debian.org>;
	Fri, 22 May 2026 11:01:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 445 seconds by postgrey-1.36 at bendel; Fri, 22 May 2026 11:01:44 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7531420947
	for <nbd@other.debian.org>; Fri, 22 May 2026 11:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1779447704; x=1810983704;
  h=date:from:to:subject:message-id:references:in-reply-to:
   mime-version;
  bh=Tz0E3EEsJGI5ASwdPGCXWabzYUHTuJzRLM6kkxRk86Y=;
  b=YPac4JKZzzsVjpN/cYy3MahaN+vavdLtDPbI14ysmorLa9+kqGq1Livb
   GnNTD9Ih4QN9iQVwVL/YibmhWoKyWtyxRCryi/2p+E4sOSxuj3Mf4HRKr
   1bMR+8lJ7NN0kVFrYXL4zttyKwcY5ajktfBC0QBwnwEU3doSZPCLcu8O9
   KZa3Se6CY5y+Z2w3TvF9daP+O/ovshCdnqx27bJbTwIYOU/XihxE6Y60u
   egn1KxspgESfUobHQt1f2gH8iASLK3niCsl4IjKxHgVBUMQ8wyTDIfpdd
   PbJm8oU8Qnv4A65ImaIslppgQIh7vIvGS+7jZ8VhTm1kAASOguOGRSdyO
   w==;
X-CSE-ConnectionGUID: 0/r7/0pRSf6Lg1vulFrzXQ==
X-CSE-MsgGUID: eHfOX+FcQR+4jJwAI7xjHA==
X-IronPort-AV: E=Sophos;i="6.24,162,1774281600"; 
   d="scan'208";a="147112163"
Received: from mail-westus2azon11010005.outbound.protection.outlook.com (HELO CO1PR03CU002.outbound.protection.outlook.com) ([52.101.46.5])
  by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 May 2026 18:54:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VX7qCRGOOko4Mk8HyRFwuPV19YueMcHIvOS5O0GeHBGSs0UIPApZfFLuB9VFyAE5DGkAroJF25xOvWq+0H2D3rZNBLOUWPfzGP04w+woKBmhAmTkF2g4hc7txMWOlcK9VgthmbtE2SKfKK858wZGKFKM6Y6FIlFWrghoabzkMIcfAAglrY0qcN/uJnBl1k25mDhK0IrX12d2E1HX1BsouF5Nv+2E/JW2Uj1BYfMrjeL6eohTsNww6FXN00dBiiVnwTbjgzFhCQMa0p+p0FI0odmqM9Uobr3V7QGTSdght29ethVGDHiqXXkfR8Q7JedolE0RjkLR52x1ij9/01wRjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAsTMxrEBUsHYqInnyD2t4BEYdeESoMLhxqDOshX7b0=;
 b=MDPMKLac2wK9R9WjNr0kA2b8iJNMiXQFVdujhuVxOOfQ2RqWEwBzSNs6m4hJIONrc4wQTeaMEBYqHtJWQl+Z5Bym95O2O/bNBIsYmfnKxWc7zNKZCESTs4BBqtZwtb2IDPNRANvtjgSS9ZjSs9piUD7kKEnPqVPKx+HSC6MIOJ05Mnjk1/QSVO0eNMad2TzzJ6xRqydZ4RmsXW/ivJBLf7ZRHz52u61sC1gf9Hu3KzxvShe2q4xXotH7BaVsfDHIp/lzRyGTtdctj+MYvtdV5DC1GqrTvgrddfsJLLRK1yAoXclhqYqQ4cLtCT2zRnVRPnDEL79fGJvyeZfwYcz2Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAsTMxrEBUsHYqInnyD2t4BEYdeESoMLhxqDOshX7b0=;
 b=FnGW59QEd72IfhlN0LmYhjA2NQllV7H0bJtjIXd1ar2EWD1fRJbzkNy7H5aXAe2qRuYzTXGuzA4kkcjXsvjLZ/e0u37dI8//X9OizmrQwWuNsiviwzHJUCcyls7ObOcoA+RjvoI0zKnQMaUfcrb0zmXZUs/fJR0LhJNvxjpE6u0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from SA1PR04MB10065.namprd04.prod.outlook.com
 (2603:10b6:806:4dd::14) by LV3PR04MB9290.namprd04.prod.outlook.com
 (2603:10b6:408:26a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 10:54:12 +0000
Received: from SA1PR04MB10065.namprd04.prod.outlook.com
 ([fe80::9b98:bf8a:b0b1:ef85]) by SA1PR04MB10065.namprd04.prod.outlook.com
 ([fe80::9b98:bf8a:b0b1:ef85%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 10:54:11 +0000
Date: Fri, 22 May 2026 19:54:06 +0900
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: linux-block@vger.kernel.org, nbd@other.debian.org
Subject: Re: [PATCH blktests] nbd/rc: redirect nbd-server stderr
Message-ID: <ahA1q0l6BbuwOW6C@shinmob>
References: <20260515053047.64075-1-shinichiro.kawasaki@wdc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515053047.64075-1-shinichiro.kawasaki@wdc.com>
X-ClientProxiedBy: TYCP286CA0144.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::8) To SA1PR04MB10065.namprd04.prod.outlook.com
 (2603:10b6:806:4dd::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR04MB10065:EE_|LV3PR04MB9290:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3afd1a-443b-406d-6830-08deb7f07527
WDCIPOUTBOUND: EOP-TRUE
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|18002099003|22082099003|56012099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	poQSInwEWvmGHD70PKp9v/Yx54iPXk2lXvu+IxDt8a7gu0PPp85srV6+Cxivfaw1K2p2+qekZhPqKDhe1Sl0Bb2RjCoj13OTZhVeQtK9sBHhTKVzW/OQGcjFqb9xw09/FQqKqFcnYfBUkbWyx/pn1dbbwvs1jBg2mcFVGsxWzT7haDPYA1/kQR5NxenbFooyT1dBzWn8LDj9A/V6Dzxs8chRCPv2zTJ1lPzEc9bMujRyMEcV+YkpK0K8aPkvUc2zB4oIOvsgSmQ55MlrEdh9NkD85GKQTLWSVCiNmkrsEcDXNcS8t/cYLgNZflLl3stXFS9LlzNJuAyMtK1Jyq3HQWDlN5C9gho9EJzGYISBlOJpeMEfBfMK/d1lvoCwKak2Ydmn/y6ZnGE1l6Gzv3zJeatYch2bdboKF9kJe8c4b4/sWkSHAehZZ/iZpW+PcG5znZoeJ6w8TmWFYXXKNLYJ5LgzLEmdO95taWbH4qmYKdHo6XffLABBE7qpgvJu/WhMs3OfQbPu82fsBYxyVKUZdkTnk/Z2Cm8Hv6cj4nXl8O68UMc+L1aspze+DkZ7zzPWrR2cgZ4uyRWbiszzosRU8c9n5a1ciATuV9PvjDShm0sgvP+c9FM96DIQBseUVwGCkomtYaS7imQJ+bldGqOjRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR04MB10065.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(18002099003)(22082099003)(56012099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qUEmq4dTL76QIphLsLSGyKQxk/G8/4+crAECw/1X7jsx7SyGH5ujlgLc8OEB?=
 =?us-ascii?Q?MCDeCxw1sb+iSKNRpFVo3mjvwQlljHF8pHhr0d6LD1beMncWJEltRLkkUKr7?=
 =?us-ascii?Q?3zI5GYpoY3X1HfPOYkfs9CZOzRNsb7KMBa35mQKiwRxtMEo9MrNGkk9V5J3w?=
 =?us-ascii?Q?ENcy2JJBcIanHvmAbdaMzTe8iFzd0wqBWFPnGxU2oKNJiQsjwvKuZLDs0P0o?=
 =?us-ascii?Q?O2LaN9znEFpHvg1RCh1Xm3RRR2BSeIKEdV57Aw3K1YyjsAOEJB4NbegAar3D?=
 =?us-ascii?Q?M94abTEe/yxbfzP34DZfpw5vMeYVtXOliSn4w6SfWvxWSPDEBjCyb/ZqdMqA?=
 =?us-ascii?Q?XLlo75MWpV//no5CM7P/DZGRgRn/wTPq2qOaG2uN404NXHcSx2jt760cd5rZ?=
 =?us-ascii?Q?cqLrXb177FGLAYUpbspWzKLB9Gc19CP9WxQzP1bmB/84EjvCudvxiGr9sNqk?=
 =?us-ascii?Q?VTCLp8MIR5mHXnLDYOg63vSVu8fJHylkpzTBTa5nqJctdlQPt2PdsbT/LTlv?=
 =?us-ascii?Q?7c+uj2a6+ENiMebVA1MIUIA6V9pBkCxvQ3ZEEK2P8FsFxWPD//dFAYuPGReo?=
 =?us-ascii?Q?oCJmW8yxZzvsPCOMWU2gAHwAj4SoprGt8HBy0p49hQIk0S5e79uwe/8SOcN1?=
 =?us-ascii?Q?ISCuRwj25QXy6q3x/9EmRobqhF75FhWOz1CyHfbaRr7OlZ1avtSomT1ykzNj?=
 =?us-ascii?Q?nYD7KhJB6iSLiILCRqVrNOXvzlxcpY5AUD+phOkVkwoZMlm8zj4sHaEFiy81?=
 =?us-ascii?Q?ndB7MNl1TOx5L9UZS9YetrfBbWvUFXdg6G0XRsNt0vkxqHjakf+5Nl1wIQKF?=
 =?us-ascii?Q?ZwIIyn7YvuGFNAXxaSzvup3YMryV6ostqxdQ4+3+L9dNgcChl5oA8PGN338E?=
 =?us-ascii?Q?bvtbqP7ANbThqbqEfK2lGpgfKxSslxectyPVLVHoEi66/yVKRx+UmaBkvVbK?=
 =?us-ascii?Q?FyjBegJv4lEJ2gUcGYMfdAeRhq3calmYJ9OXQH0OeBEF9i6GZn6yMdo30p9P?=
 =?us-ascii?Q?EU/ALwH05p2IOJMp+0opjsWNWEw5jkeUdiJzb7hhW6eugp/kaePZIgRSTnEG?=
 =?us-ascii?Q?f/XGjfSGmjx5thzC9M3863MOIVXqUea5lqORaD9tQfpsUeyIu5aRz8p46prG?=
 =?us-ascii?Q?DI9pguQhlLFv1F5hhnyc9JmIVUbDHhjDiIZg2w4cfXfxprz/wG93lDvcf9LX?=
 =?us-ascii?Q?8YKuuesqnQdAgPzhf+b6MR0TFId5c6oguB5wmxi0NGbCNTfLP5+rvDg28HVv?=
 =?us-ascii?Q?2UThjazaQA4c80M/dziVPPIJYLh5rbN4w7CJOtvPIlV7xbfGPrd68swiB5La?=
 =?us-ascii?Q?Ie2KWMH5lz5uX5jqlWLhBv36+fJEyR/tfCUFidnoB2Ha0fvb572YIIpSuroE?=
 =?us-ascii?Q?WYrUGcnKOQ46zXm5sUt7NqroK/oawyrC6/gNHn9qYxq0+kIw209wludGVdQr?=
 =?us-ascii?Q?CuyMq5JdopmwNQyAQ6pwf69BbhLrkyauWps9TQxdFkEJlOdnai6Usrq1oMqL?=
 =?us-ascii?Q?RDyeolJwcGve/nLrPXw/x6HHGO84ZxDEDZ7DzSi+nTTY5+61Y0cKzwu6z5dW?=
 =?us-ascii?Q?a/SjyUwxuJt+4Qjgv1i6t8vlNsfCjlCgPQbCU913INowTxw6JwcJpdRTCYBC?=
 =?us-ascii?Q?XWz5bT69fC5OfU93Amvv+lbfsTjt16dfyebdqeYFce+vOujnwREgJvenvXbK?=
 =?us-ascii?Q?Q/0fSbN9irUvnC8crPFINV4DRyhCT5wO3t1WK2bfDfl3eBzHYrK0w40b3GSl?=
 =?us-ascii?Q?1PXMr7GsjIz8zBWxqy2lkToN9mxOjwY=3D?=
X-Exchange-RoutingPolicyChecked:
	VZ6FyMc92yQh0nPUjrNPcZZRk8cUUr2OuG3/ZuWVCQbiW93nCoQKDxj6wHM8Y2pPXEPW3LdYOWH9taKk3JDhacnS+kExFi7k3+J6YsYWOqqhVZEYhtvIOw9XlU7xSO2Hq97C8Hj2Kdji//CkuWYA/YWBnTUBEneU8FyY6WMLv5fWKSiHuR3cXgIcbEE8WR5RPaz0MrngEVpWVWJTX+lOefHAUGzkeUcG1aoGP2gIZxFyvHdpqyXr40Es8J8RcfPQw+ZsPuzipw+qA5TLagGYtmQdCHA3wtBy5liLcm0okQBeP9wrYCGXFtbFDIdb6swmw0Bdd/TWtpxc0Sw1C+oXLw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vMak2V2y44YsZeEzQTz/SfwOVSqjnjLx8MF7bVUgW4PXxeVCmmQx3MPxUIDGDk9BaLfcKbnG8pCxYmkswMyXfom2poc2mwc1fcPtCPu8uJ6FUbdX6ltv0M1fiKQ8LrOwEBnAyhCxKXilpzTX0UmWsidTkk6BpADxACr1s85E/FrWLioS7TF0rj1PnlrUvP0RypFki9Pc85pKfPPfYTJHxgLuHUvKwZPufDjLwPu1b5VO3U/AeXtBTjglqlNhBi5UhhD1NvqqMA8rwdyIRm22tPeD3LBJlVdPMyrW5c33V0kD8djwyGomaNUo6xP/rhvi0HcRZPkBnpoQV2c6uCgCOnreWqRVhhzHpZgiQJvIJfwr/XS1DTfi8SpFHUyBfBIeEhC/eWQDjSMVFlIMIoi4hfcxM+f27ZCJ0uQAbYnfsEmtfAOupFKLF1wJvp/h4RLAMzbv9jKKGhfgtquE+LppW9YIG4m81OUzyF+KQL/Ok2ulwZsa//n23G0RcUnNsrV61C+NGYDSbkw5Fq/g6B7OYPbWY6a1LM1GIP/874ton1Xdeh2hgFaGosv3Ws7gRWxbPV3IrmPl4l0ohZud+ZkaXam+afH/cMkNehD+onTYBfFdLQhjwvqzsP6Lzz91yFJZ
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3afd1a-443b-406d-6830-08deb7f07527
X-MS-Exchange-CrossTenant-AuthSource: SA1PR04MB10065.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 10:54:11.9478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+8h5nQArbB4zmKForPy0efIem+2I2JLzoRdbypvTwETVNBSqrdB9rpU7782EPKPVaFBBlIGkD9ogxVzS2ymKutGTWGxEpT7iB5Zv0Mmsvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR04MB9290
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <voCSscDRmpP.A.wKuB.ztDEqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3538
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ahA1q0l6BbuwOW6C@shinmob
Resent-Date: Fri, 22 May 2026 11:18:11 +0000 (UTC)
X-Spamd-Result: default: False [0.49 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[wdc.com,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[wdc.com:s=dkim.wdc.com,sharedspace.onmicrosoft.com:s=selector2-sharedspace-onmicrosoft-com];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-block@vger.kernel.org,m:nbd@other.debian.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shinichiro.kawasaki@wdc.com,bounce-nbd=lists@other.debian.org];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shinichiro.kawasaki@wdc.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[wdc.com:+,sharedspace.onmicrosoft.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:rdns,bendel.debian.org:helo,wdc.com:email,wdc.com:dkim,sharedspace.onmicrosoft.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	TAGGED_RCPT(0.00)[nbd];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 928AC5B2DB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On May 15, 2026 / 14:30, Shin'ichiro Kawasaki wrote:
> Recent nbd commit da5e07c057ab ("Reimplement daemonize() without using
> daemon()") changed how nbd-server daemonizes itself. After this commit,
> nbd-server prints messages to stderr after daemonization. This caused
> nbd test cases to fail due to unexpected stderr output.
[...]
> To avoid the failures, redirect nbd-server stderr to .full files.
> 
> Link: https://github.com/NetworkBlockDevice/nbd/commit/da5e07c057ab
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>

FYI, I applied the patch.

