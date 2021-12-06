Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF846979B
	for <lists+nbd@lfdr.de>; Mon,  6 Dec 2021 14:57:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A760720922; Mon,  6 Dec 2021 13:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Dec  6 13:57:09 2021
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3E7792088B
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Dec 2021 13:40:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.818 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MSGID_FROM_MTA_HEADER=3, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Xqsa3HBb6oti for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Dec 2021 13:40:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .virtuozzo. - helo: .eur05-db8-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
X-Greylist: delayed 5588 seconds by postgrey-1.36 at bendel; Mon, 06 Dec 2021 13:40:04 UTC
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2101.outbound.protection.outlook.com [40.107.20.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8573C20888
	for <nbd@other.debian.org>; Mon,  6 Dec 2021 13:40:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBs4ZylF7YaYdohvjhPMlgoH073gaWNz46jjzKyITZyzOi+m8GRcaJIb/oY9nyOaKJ/CtoYeWzFSKGWNLB6YcoVEPY/T7jIUHqe/XBnsj4cyTvJoKgMLwJTHLXGv5XwLAwDIBeuzofIy2Kuq43dZO9dkkDlZKOcMuZcjgHozSnQDTI9hiRWqa4JFVttMMZRuwwUhI3XtDb+SNO2fARzec5IvXLhMbETaABgWg3UTQTpoZb8n3bgqrEgiiwIrmpckgUvdY0pn/OhQD0Ea1iG/dFOSpdGAz+Qbl0wcLITxyRm1TvwnoI+hMbBuISBLZubRxZTaytRSpyIssb5d4Oq+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/ps9Ef1uz94b4IXP2HeYLUZyHMI58W6uEhjpaMUxiQ=;
 b=FD71UegrK1Az/V37OoSKDKsbizo1MWupszGGdNMXRrc8QGCghaujOJbir+eevPY9KUvdjbxDjhQWcdRa8Ve5w7Hu5P/2z65gJAQ3jCkN7ioAFRpsK2lQujgg89lG85MGp1gfxR8e2VACQSRBRUG97LivDd0GOT9Mt0CM1tB49cbA5xxBZKD+xvCJxZmtfQnPtUBi5GPYIP02HvaJNcHN56c+2KrrD87Y/zDsTStnAPQoJSiQV9fXCufw1kdTuU76ZyajGU309EE3ejiHLv1lZykTBlHNPDSMcxZQwiNFq6hQmd43TiRaeqfG5boKnC1Are0igHIlkEbeBOqG0PQZFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/ps9Ef1uz94b4IXP2HeYLUZyHMI58W6uEhjpaMUxiQ=;
 b=ryMmpqxeOqtmhwYlWll0YUCGCOgoyv7YrHGDM48Lmv/7q9Mp293Z0hp0Z7Nxt7mvcGCbua0Z2Z+vyju5iLt7o0l/zQlaBHYioa2MDSZtXV7QzQY9MYuO9Rl8Bm02V3aUTJU3d5JcfAxhJaaGVzp2rf/oivikge+nCRvPZ/PQXg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Mon, 6 Dec
 2021 12:06:52 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Mon, 6 Dec 2021
 12:06:51 +0000
Message-ID: <747f3e5d-53f6-7eb1-e3aa-85759c050ac8@virtuozzo.com>
Date: Mon, 6 Dec 2021 15:06:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 02/14] qemu-io: Utilize 64-bit status during map
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: nbd@other.debian.org, qemu-block@nongnu.org, libguestfs@redhat.com,
 nsoffer@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231539.3900865-1-eblake@redhat.com>
 <20211203231539.3900865-3-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211203231539.3900865-3-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0034.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by AS9PR0301CA0034.eurprd03.prod.outlook.com (2603:10a6:20b:469::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend Transport; Mon, 6 Dec 2021 12:06:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b859fa5-c526-4a61-e4ae-08d9b8b0e343
X-MS-TrafficTypeDiagnostic: AM9PR08MB6737:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6737B2C9006CAA8D068BBE49C16D9@AM9PR08MB6737.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G6YgNiYgRqHofvEIUiaYBOoX8JzuQLp4HDMPY/DVHb3Aaaxenpz/nCUIVrjrFemLOAnnGIuyOivag1FfukxfSrUNss3rEwgIgae/BfoK0MT3WoODHgYlUdSIaW4ApbH4LDOseiB5ITy9Sd/TGDbZjorpftpE6PV/36oqvi8AvUiSxZrdX++b6wrpR/Qhqix5Ci/kjInzbtTTiy9FQIaBTg1caau4tPNLLKScQT7d7HX0SDpb+X0BMY4u9iPRZj2Cd1ILf2TjLFmWLhSPQG9bdawTnI9HljSo2MCWKQwwjgID/dDdcHBf4IXJ/q3sgls6cY2vVFn1w9/EaccmU059fh1jJASXMH0mr9akFcIB8qQnGewb5domhzUP8HlGHSCLQy/HlLhwwFg+043U9AC9AyDh0I8o7iUMZSvqFx5lEtOHMm0kxOdWv0TRWAG7W0bz7QOt0NXvElOJoysYcEQFm9JNUyctbMIJeqWWi6xiM8t/iGPKHnmWw/ebkTJeEX0ApA1jnglqeVIKB0fQnTEsagJVzOqFWa93QANJtX+zQ44Ay0PGdcJqTxCMt5unSMHRJ9aRk01ZcdK004K7+rIEN/9wfX1F9SnuPT8oH0SItmlgn7pbmkbkhGz/RnRkx8P1nWJwohLFI1RGreDx9QheP5T8LCrx6VTpNNuvdkGxo5JAfECcyb1kN84v+l4RsdLj/kgp+C+AbvZP42u33LsvrdoZA8ja1SRU67VIIV+BZxOxqwaG+RVuzxDZ2TnXE4RrVnv+tFu8ALEACRNvSHJ3Tw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6737.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(36756003)(186003)(6486002)(8936002)(8676002)(956004)(26005)(16576012)(4326008)(31696002)(5660300002)(508600001)(2616005)(316002)(86362001)(52116002)(54906003)(38100700002)(38350700002)(66556008)(66476007)(31686004)(66946007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXlTOG1ZNFRnZ2xSbTVObUtQVlI3WEFQWXJqSk4yamJ1V2NucDdndHBqRmlt?=
 =?utf-8?B?V0NxQXdib21sS21VZjgvZnZQWWQ4enRLTWZsNy9qcjdDM2xCL0Z1d1JhYkhL?=
 =?utf-8?B?K3hyelNZR0xNWEs0aWlwQ3VGUERiNjU3R1JSSVZMakg3bVFvejFWc3hyaldC?=
 =?utf-8?B?SEdhZzd0cDJXenlxT0NZMTVSMmhVZlVCQTBJMUlGMDROdXdxMWVHTEkrOVU3?=
 =?utf-8?B?L2p4MFJSUk1jaUxaaWE0VEtZNENneHVWaVViKzRhblNuT1VaLy9JdWRBbDBt?=
 =?utf-8?B?OCtMUWk0Q0cvdkEzY2xCRGQxNWdSelQ1NCtWZzBJOThmRG9HZnhkWE8zZDVZ?=
 =?utf-8?B?bUhGT0czMVdKVGZTeFFoSzBvNE1WK0ZRYTduYVovQXBkYldFK1dMMGl2V1R0?=
 =?utf-8?B?aHpvTzRyWmxPNDZjYm1BNmphNEpOZGJURXh4VHkyNjFjS0h2aTJsUVhSellE?=
 =?utf-8?B?K1RoQk9qOXNhMWx4ZWpTa3Yyb1VXSzY0aXFEaUNQYmo4eVQ4K3g1Tk9jelZB?=
 =?utf-8?B?VkNPWjYwQVlEMFdNT2JtWTJkZ2lDNjFnSWMzYWpYcG1GNFpLOXhYRW1yRHdy?=
 =?utf-8?B?SU5TWHQ1VlI1ajhHMTlJenNDQmNjL29LTDFPMDhSazU3S1B0b0l1eUNSeVov?=
 =?utf-8?B?MTF4RmNkZzl0OFl2dUZGc3REOE01citycWxZeEdzdW1LL1RVNHVrejZrd1Zl?=
 =?utf-8?B?RHI4Mmk1SGhCOVJlYjNhWkhwc0V0c1RyTHRYclNDeEJaQ3pYV0I1SU4yZngz?=
 =?utf-8?B?YXpuUS9mWE1pQVNFQlFsSmJaSVB6dmcvaEVlT3JMdTFrUWNhNzltcmRyZ1ph?=
 =?utf-8?B?RHJaNXd3dDdwN2tzbFplL1hWRld1Yjd4ZVR1NXpGRE9sU0dmMDkza2tYWUFS?=
 =?utf-8?B?UCtjdkM0b1F3c2dHQ2hEY2UyUkFYTENyTDdxSEg2K01BQ2h0SlE4eWg5RHNa?=
 =?utf-8?B?aXVzbjI1L0F5cGVOSDRDQnlMWVNZL25KcCtEUjFJMytSTHIzSExHN2V1YzVL?=
 =?utf-8?B?N0s3U2VzbU8xSElWdkRkR1d4Y2hDdDdDMExmaHlGaERqb0tTeTN1cWk3MDU4?=
 =?utf-8?B?eW44R0JPZnlIcjQ4SlpMTGE3aUxxRENDWGtWTCtQN3NQVzFDME5TNFNBMGdw?=
 =?utf-8?B?VVBxM04rVjh2amxmdG80NXpXVkVkWkNKYXFtMEdvNFdGUUYvVWZYTzJvL05s?=
 =?utf-8?B?cCt1LzVPbXNZR3pZZUdvWEZQejdYTWdLME4wZDdvUUEweVI4SFNwWm5RbnhM?=
 =?utf-8?B?bHZxY0c4U3BIeW5mMyt2SXM1cmFoajR2YzZjM3R2Z05ZWlppeVRKR2xSenhD?=
 =?utf-8?B?VXZrTUJZc3NzVmVSczM1ME9YblVSZzlUM0EvbjhwVU94b2ZkbU9BYXpzOVFZ?=
 =?utf-8?B?dGtnOURab3ZWRFFvM1hOdEZPeFhHc0tSZ2JRNHQ2WHhQeWYrbFpJeWpYbEpB?=
 =?utf-8?B?ajNRcnpLRHlOMlhvcWloVU96SVoyTmJ4aDhURFIzQ1FzOE5TdktpbHlHT3Er?=
 =?utf-8?B?RGJEQXNYNWtPSWhXMkZZTGF6bGFtajFjUzU5OGtsWjVHSVdvakJZbXJBQTJI?=
 =?utf-8?B?T3NDdzBRZTQxWkRISWtPcUdJMldWMVhTNTJZTnFJZ0Z3TCs5VlM4NVk0bVRL?=
 =?utf-8?B?MWs3cjY5T2tIR1BhaHBBQm03bEVNZ21OY3ZwS0pnL0Ywc0dvazJ3Zng1ZkZR?=
 =?utf-8?B?cmFOZHZDazgyNFQzRVlhTXliMnIwVDNsYjMwbTFOd0JQWEpES0M1ek1ITUZC?=
 =?utf-8?B?Z1JpbkwwVUcrY0FaRHpyQnVQb0FOZitDaW9YdGsyZlF0cFlkemlzQU1nRjZI?=
 =?utf-8?B?Um81V2RucDRTMzJKazd3U3ptWUxoUGJ1Z0NETEM2M2hGZFYrcDFId2F5Y0ox?=
 =?utf-8?B?Qm1XMnR1STZGME5ja2JvVldOdWcvTE96UFFuMnpBcnZ3aEdCdExlOGFBb2Fn?=
 =?utf-8?B?Ujc3MmxZdmRnQnB3Ym5HZjdZMUk3OHJkTlFLTTkyZ3NsaGF2c1VHMWNpOVB1?=
 =?utf-8?B?UkdueG9yTFd5M281T3NhdFZyUHRXM1FYSWNmQ1dQU0pESExiZ1FEYkVtdVFj?=
 =?utf-8?B?akNRQVptYlFPNGtvQmwySUtQOHFweURMSUgyeTEzdlNqeEF6ZnUybVRCRWU1?=
 =?utf-8?B?bDM3UkdYMlJzLzdmMWhpOHpJdGtGY2tiUCtoUkQxVWUxR09CWWdDTDFLTEFm?=
 =?utf-8?B?UkZ0cnpUdSt4Z1NGb2c2R3N3SlhFNmdpRktUK0hjMkd2L0R0YmdnMUdyVnJN?=
 =?utf-8?Q?FmXdSoa3ArZG0/wDQUDWzMZfHGVvHiLYXFGsq06wWs=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b859fa5-c526-4a61-e4ae-08d9b8b0e343
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:06:51.8707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsMXwoJBYInV/EdZ+BrLQY2oLGnWJuteoz2nm//MsQbeFuyxQ5FXbZbjvtyfHyuaDgToDuHUrnrOIgiVvLrI2EB01G1Mg8qMaqHG1E2n/aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6737
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <i_m-cnj3ICM.A.OvG.1ahrhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1651
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/747f3e5d-53f6-7eb1-e3aa-85759c050ac8@virtuozzo.com
Resent-Date: Mon,  6 Dec 2021 13:57:09 +0000 (UTC)

04.12.2021 02:15, Eric Blake wrote:
> The block layer has supported 64-bit block status from drivers since
> commit 86a3d5c688 ("block: Add .bdrv_co_block_status() callback",
> v2.12) and friends, with individual driver callbacks responsible for
> capping things where necessary.  Artificially capping things below 2G
> in the qemu-io 'map' command, added in commit d6a644bbfe ("block: Make
> bdrv_is_allocated() byte-based", v2.10) is thus no longer necessary.
> 
> One way to test this is with qemu-nbd as server on a raw file larger
> than 4G (the entire file should show as allocated), plus 'qemu-io -f
> raw -c map nbd://localhost --trace=nbd_\*' as client.  Prior to this
> patch, the NBD_CMD_BLOCK_STATUS requests are fragmented at 0x7ffffe00
> distances; with this patch, the fragmenting changes to 0x7fffffff
> (since the NBD protocol is currently still limited to 32-bit
> transactions - see block/nbd.c:nbd_client_co_block_status).  Then in
> later patches, once I add an NBD extension for a 64-bit block status,
> the same map command completes with just one NBD_CMD_BLOCK_STATUS.
> 
> Signed-off-by: Eric Blake<eblake@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

