Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BB328151875
	for <lists+nbd@lfdr.de>; Tue,  4 Feb 2020 11:06:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7F4FD2047D; Tue,  4 Feb 2020 10:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb  4 10:06:09 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MSGID_FROM_MTA_HEADER,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F2AF32039A
	for <lists-other-nbd@bendel.debian.org>; Tue,  4 Feb 2020 09:50:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.92 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MSGID_FROM_MTA_HEADER=3, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zNNHiu5bLqdt for <lists-other-nbd@bendel.debian.org>;
	Tue,  4 Feb 2020 09:50:27 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .virtuozzo. - helo: .eur04-vi1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
X-Greylist: delayed 2055 seconds by postgrey-1.36 at bendel; Tue, 04 Feb 2020 09:50:26 UTC
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on072a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::72a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id F11AB20391
	for <nbd@other.debian.org>; Tue,  4 Feb 2020 09:50:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFYKXFayQxWru0nlSkjhONi6um2M7bIuWb+bmXRlENmsLZe7JuWym2oj1jfzXAgO+Oy4NcVKERNvwI5tCDcLLDiTYyeBmoH0GeMhimf+RvCxBIS24JdMHlERwCYiTamD6h3/IwZYFF999qrg6LyuxlED5i/I4eTS/i3rC2ef57UCoACvso0S7Hllts3E6Q0DJ9+V2INJXbTmt3trcAAhsSsx2JI0Qp5iQnGUsIq1CxWDVMMCN6RcJU3bcalXXOzNKuvOTkxcMmr+pgVOJzOqyPVXbNbvPilga0D5O9k/Lc9HU0KF/PiSOX2ELjwm/a/iB00jP+mm3ty9qevomJyE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+Y/ly3GT9bCvwnXFsFAu3CROJhGqdypy3GysQvY8fo=;
 b=l/Lfz6g9Hb/meENLxh3SurNUuMZ1hCkUP8w/Wt1nNWOEo09WG4PYQJYvVhbxpGt/rT519o/ItMwAF0jmd6cDl6F13OURGq4hgkLMfVZeQyu45vAGCkZZcPiWZqs3W1CPAdd+hcJvezYGH45tgU8UQQIXI8rZgjkyPEJ96eaLwTLRXaoC2h7kbm1Pmg9s1Qd5qWHnBXh3rVsTvb/7P6dZtzD1BnIZX7LGPQI1oGuigwodKnfgVkB78pXUL6UwwtM1uLkdBKBNA+4ScGEZdug1SfVjaL7zu6xSOOANS0xyEBBBCUH6eSpk0o6nRQlw0ebcNTR9NLcpywyxBqnLpPc+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+Y/ly3GT9bCvwnXFsFAu3CROJhGqdypy3GysQvY8fo=;
 b=NPioL24unBIzAdQx95ar0m/gSMQbrfb2S8GoVbraR6U7RRCzfHc1O0ttf0tPZM0ZlkPKgohe6FY4py2NDoNXcOJkC2fcRKoWdeuW58MU3SAkqmozDmLsdLxWdbNLXMvP1ldle6bXuY03p3T9z8T4XqPOm/tXFOnzy0xGXTm+pjQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB4884.eurprd08.prod.outlook.com (10.255.99.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Tue, 4 Feb 2020 09:16:07 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030%7]) with mapi id 15.20.2686.034; Tue, 4 Feb 2020
 09:16:07 +0000
Subject: Re: [PATCH v4] doc: Add alternate trim/zero limits
To: Eric Blake <eblake@redhat.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>
Cc: Denis Lunev <den@virtuozzo.com>
References: <20180501212242.986796-1-eblake@redhat.com>
 <bbf265a8-3380-e153-1fa3-3a7c9048692a@virtuozzo.com>
 <272b17ce-9247-e751-b85f-9eda492c3853@redhat.com>
 <5de902a3-bbe3-4415-8238-57d0f8e75371@virtuozzo.com>
 <08f2380d-10c6-ef3c-4361-2c484cd90c81@virtuozzo.com>
 <e4ffe034-b2fa-f7e6-aa5c-e7db55f546b6@virtuozzo.com>
 <ef0bfebc-b222-8e19-8828-d1cb4d32972d@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200204121604668
Message-ID: <9ed0545c-a3d6-1647-4f6a-69c767d63340@virtuozzo.com>
Date: Tue, 4 Feb 2020 12:16:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <ef0bfebc-b222-8e19-8828-d1cb4d32972d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0264.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::16) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
Received: from [172.16.24.200] (185.231.240.5) by HE1PR05CA0264.eurprd05.prod.outlook.com (2603:10a6:3:fc::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.30 via Frontend Transport; Tue, 4 Feb 2020 09:16:06 +0000
X-Tagtoolbar-Keys: D20200204121604668
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 284a349d-5bfd-4aef-d16c-08d7a952ddac
X-MS-TrafficTypeDiagnostic: AM6PR08MB4884:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB488437A4E51FF321B5362612C1030@AM6PR08MB4884.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03030B9493
X-Forefront-Antispam-Report:
	SFV:NSPM;SFS:(10019020)(346002)(396003)(376002)(366004)(136003)(39850400004)(199004)(189003)(16526019)(8936002)(26005)(186003)(2616005)(8676002)(4326008)(81156014)(956004)(81166006)(31686004)(86362001)(36756003)(478600001)(66476007)(66556008)(53546011)(31696002)(66946007)(316002)(6486002)(2906002)(110136005)(16576012)(107886003)(5660300002)(52116002);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR08MB4884;H:AM6PR08MB4423.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L4myCLLF+/pRph4ygun9TxrZ9qCsEsGmt1j+5R+OYqmj/D1EJySX5aWIXTQhTYLLY+v9kNf38u4TOl6dw2a+qz1Azyrmfq2/upd8pkOYTzMrg5la9U5F3FgA10wWCm4I/FxR2mQlJf/nSwgeO4FJUaA4yRsZgIJH+Z+PLqH5xxykjCkj5mv0DF9q1gzrsA7WZtyft8n0XeEEBZTPLd3ZlCPQB36E5Koo97rMW/sOmKnE2N6m81ZYX+wElYOUwJo6qKtYxViRr+T5xXwG7w2z/uLQF4fcwSNUAp3mZcOSYE/pdLdV2xTY3vkCbaLaehsxON5aBJG09JU2+6N/BBe5hXvjxXO3uNSgnOVA6t2Vp+zGcPFd64EOfUcfSaceZuPQhASUVXeVU1wQkKv1S/y44F6AgU1cXK/ANJwbGDIb16wsJ8AO74BY7s2P0J6/HwPB
X-MS-Exchange-AntiSpam-MessageData:
	XiY0YMTvmuXOBehtyqFJd+lezfI5EF7RZOeN54S7+8KzUO5Ggu3kEa4LH5ZobuIF6MnlHhkNLakvBX+ovBtgbJ0I9LUvgYSth8s8f/DxosXO/Co7V00r0Zc3d1ztTBCMqBaxmnLOH7QqNkztQycVOw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 284a349d-5bfd-4aef-d16c-08d7a952ddac
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2020 09:16:06.9926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gitp1S2BhkvZyC8+02J+RwMsAVD0mck2vnM3Tu7v9PIRuFnNGF6Fja3RIL/NmAkvCW2/5w5S5n7/C+zOqSQDkdXr1FAmnj67jOLx8gYy/FI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4884
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tBnmpfCkgPI.A.es.RIUOeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/789
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/9ed0545c-a3d6-1647-4f6a-69c767d63340@virtuozzo.com
Resent-Date: Tue,  4 Feb 2020 10:06:09 +0000 (UTC)

03.02.2020 22:34, Eric Blake wrote:
> On 2/3/20 1:18 PM, Vladimir Sementsov-Ogievskiy wrote:
> 
>>>> Investigating our heap of patches in virtuozzo qemu above rhel qemu, I now look at two patches which actually drop these restrictions
>>>> in client for WRITE_ZERO, TRIM and BLOCK_STATUS. So actually we just live with a bit non-compliant client for more than year due to
>>>> these restrictions..
> 
> So far this is working well enough that my idea of an extension still hasn't percolated to the top of my todo queue; but it is is getting closer.
> 
>>>>
>>>> I didn't answer your question about BLOCK_STATUS: yes, we need large BLOCK_STASTUS requests, as qemu-img convert does additional loop
>>>> of block status querying before actual converting, and this loop is slowed down because of restrictions. About CACHE I'm unsure, seems
>>>> we didn't face such problems with it.
>>>>
>>>> Do you have plans or ideas on this topic?
>>>>
>>>> I think that for BLOCK_STATUS and TRIM we can safely drop max_block restriction at all, documenting that max_block is unrelated to
>>>> these commands, as actually, for BLOCK_STATUS server may return less then required anyway, and TRIM should never lead to some big
>>>> allocations or calculations..
>>>>
>>>> WRITE_ZERO is a bit trickier, as if it is backed by just writing zeroes, but we can at least drop max_block restriction if FAST_ZERO
>>>> flag is specified, than client may implement write zero as
>>>>
>>>> write_zero(FAST_ZERO)
>>>> if failed:
>>>>     writing zero is slow anyway, do it in a loop.
>>>>
>>>>
>>>> So, in other words, can we do something like this:
>>>>
>>>>   diff --git a/doc/proto.md b/doc/proto.md
>>>>   index fc7baf6..4b067f5 100644
>>>>   --- a/doc/proto.md
>>>>   +++ b/doc/proto.md
>>>>   @@ -815,9 +815,12 @@ Where a transmission request can have a nonzero *offset* and/or
>>>>    the client MUST ensure that *offset* and *length* are integer
>>>>    multiples of any advertised minimum block size, and SHOULD use integer
>>>>    multiples of any advertised preferred block size where possible.  For
>>>>   -those requests, the client MUST NOT use a *length* larger than any
>>>>   -advertised maximum block size or which, when added to *offset*, would
>>>>   -exceed the export size.  The server SHOULD report an `NBD_EINVAL` error if
>>>>   +those requests, the client MUST NOT use a *length* which, when added to
>>>>   +*offset*, would exceed the export size. Also for NBD_CMD_READ,
>>>>   +NBD_CMD_WRITE, NBD_CMD_CACHE and NBD_CMD_WRITE_ZEROES (except for
>>>>   +when NBD_CMD_FLAG_FAST_ZERO is set), the client MUST NOT use a *length*
>>>>   +larger than any advertised maximum block size.
> 
> Meanwhile, this doc tweak makes sense to me. Would you like to submit it as a proper patch against nbd.git to make it easier for me to apply the patch correctly?

Great, I'll send.

> 
>>>>   +The server SHOULD report an `NBD_EINVAL` error if
>>>>    the client's request is not aligned to advertised minimum block size
>>>>    boundaries, or is larger than the advertised maximum block size.
>>>>    Notwithstanding any maximum block size advertised, either the server
>>>>
>>>> ?
>>>>
>>>> Or it will make existent nbd servers non-compliant? At least seems qemu nbd server never forced these restrictions
>>>> in specified cases.
>>>>
>>>>
>>>> And, additional idea: can we in qemu just ignore these restrictions up to first EINVAL returned? So, for example,
>>>> we start with bs->bl.max_pwrite_zeroes = INT_MAX, we send WRITE_ZEROES with length exceeding max_block, if server
>>>> replies with EINVAL we retry current request using limited length (we have to do it in a loop) and set
>>>> bs->bl.max_pwrite_zeroes = max_block.
>>>>
>>>>
>>>
>>> Eric? Now, I'm investigating the heap again, and remember of this talk:) What do you think?
>>>
>>
>> Any ideas?
>>
> 
> I still hope to revisit my idea of extending NBD_INFO during NBD_OPT_GO to expose actual server limits for trim, write zeroes, and block status.  But I'm also about to post a different extension adding NBD_INFO_INIT_STATE which would let a server advertise to the client when it is already known that the export reads as all zeroes, so you don't even have to TRY to use large trim or write zero requests, nor iterate over the image with block status, but can immediately proceed straight to writing just the non-zero portions of the export.

Still, bigger zero/discard/block-status should be useful in cases when it is not about all-zero target.


-- 
Best regards,
Vladimir

