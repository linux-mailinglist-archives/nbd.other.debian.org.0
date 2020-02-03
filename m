Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 060ED151082
	for <lists+nbd@lfdr.de>; Mon,  3 Feb 2020 20:51:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E26F32065F; Mon,  3 Feb 2020 19:51:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb  3 19:51:15 2020
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
	by bendel.debian.org (Postfix) with ESMTP id E0BA5205DC
	for <lists-other-nbd@bendel.debian.org>; Mon,  3 Feb 2020 19:35:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.92 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MSGID_FROM_MTA_HEADER=3, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hV3JYz8F0kXN for <lists-other-nbd@bendel.debian.org>;
	Mon,  3 Feb 2020 19:34:56 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .virtuozzo. - helo: .eur04-vi1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
X-Greylist: delayed 964 seconds by postgrey-1.36 at bendel; Mon, 03 Feb 2020 19:34:56 UTC
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80098.outbound.protection.outlook.com [40.107.8.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7DE9A205C8
	for <nbd@other.debian.org>; Mon,  3 Feb 2020 19:34:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMWfCjHCmWLRwEK2LozfB1xO37g/oLWsqxtepVwaZaeLcDiJrjUyDkRg+FYqI4B77PqKbVHYCrtmXgBcWX43FeAFUkb59RUKAL3Pux2w6JE2j86OyosFYyUoNaVna02kcvHLBESb4KjOwTXZ+zkrIOruh/MnkB+tD0G0J/vAxeeey+T6jcX76i2AtD9Wp0hzHuZlp9sJv/XLzG2I8O1UooFAICbaP2Fh0BJAnaJUC24mUMcrGWTAdil+6yYpdDJJoIGuNUVN/ECKPLv1fp/mpFjSAlondAEjGW/hX+DbzscFc55pVK6slpiJbzL7ilSvCJEg1Or/Xy+MXioUgB1/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUP8pSQg/ioxsU51Itnn68QDfiP3QIBNPSDQ/vcM5O8=;
 b=XlrwCduBlEF49tfWvYvySLrhlwjWUjrZtrYHWlBuPIno84vQcB1fSyJV8tvcTsWs/m8TVWIZqWh9668HUQRrdH25UDdphxYxRtj0TX+V66MpPtQizT+9jW1pb+5DuNbucUYSij50A9L8WxNAiNijNcw4lOW2wbRuCUcZ6CggsCbAohMOlm3era+iWiDkQooiKELWjUlzRgue21I2zSpX71yG7VhAAEuf0RMdCQxBcFo806/iScfOe47I5ewFiDxAU+qd5dusmGnpjgCJYPI4CYe7EaICiZDE6SRbAKqas7VZNW4WQPE2R0aXXjnep6pxXbURXkyse63dRl9l12QtHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUP8pSQg/ioxsU51Itnn68QDfiP3QIBNPSDQ/vcM5O8=;
 b=TtTWmoLx3YGjmBjM8xr6PXQZ0/c2tFdmGwndrbGLKE6434XI/o9sOb0tnhv8469d6U/IUUyBxEmvUGr/qY8FIgAoS06WOPBsAJwAqwH772zdDqzTxTBNrh39QiBcbT2Bf0NZKJRvA02IV9d+QenoIEYpiRKn4Vseww86WwgZHqk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB2997.eurprd08.prod.outlook.com (52.135.165.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.29; Mon, 3 Feb 2020 19:18:46 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030%7]) with mapi id 15.20.2686.030; Mon, 3 Feb 2020
 19:18:46 +0000
Subject: Re: [PATCH v4] doc: Add alternate trim/zero limits
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>
Cc: Denis Lunev <den@virtuozzo.com>
References: <20180501212242.986796-1-eblake@redhat.com>
 <bbf265a8-3380-e153-1fa3-3a7c9048692a@virtuozzo.com>
 <272b17ce-9247-e751-b85f-9eda492c3853@redhat.com>
 <5de902a3-bbe3-4415-8238-57d0f8e75371@virtuozzo.com>
 <08f2380d-10c6-ef3c-4361-2c484cd90c81@virtuozzo.com>
X-Tagtoolbar-Keys: D20200203221843409
Message-ID: <e4ffe034-b2fa-f7e6-aa5c-e7db55f546b6@virtuozzo.com>
Date: Mon, 3 Feb 2020 22:18:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <08f2380d-10c6-ef3c-4361-2c484cd90c81@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR0401CA0068.eurprd04.prod.outlook.com
 (2603:10a6:3:19::36) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
Received: from [172.16.24.200] (185.231.240.5) by HE1PR0401CA0068.eurprd04.prod.outlook.com (2603:10a6:3:19::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.29 via Frontend Transport; Mon, 3 Feb 2020 19:18:45 +0000
X-Tagtoolbar-Keys: D20200203221843409
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dad00302-2c8d-4801-a89d-08d7a8dde3c3
X-MS-TrafficTypeDiagnostic: AM6PR08MB2997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB2997F4E14A2869787389FB8BC1000@AM6PR08MB2997.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0302D4F392
X-Forefront-Antispam-Report:
	SFV:NSPM;SFS:(10019020)(366004)(39850400004)(396003)(376002)(346002)(136003)(199004)(189003)(66556008)(66476007)(31696002)(107886003)(6486002)(4326008)(81156014)(81166006)(478600001)(8676002)(86362001)(31686004)(956004)(2616005)(36756003)(2906002)(16526019)(8936002)(53546011)(52116002)(66946007)(26005)(316002)(5660300002)(16576012)(110136005)(186003);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR08MB2997;H:AM6PR08MB4423.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WjOJAyTpGro4b/YxM4if75Skfq6u6JuX9At4/keMtvSMHag3kfj+TWF5h5GDvi10JZ/c12qJgMzzvB98RyqznItPOBJmfS0IFxQ+CxGXGz1Y5xaena0wTDZuLv7V9LK7joxqGM4b8nA7NJ2mJwUznvwnd6mM9MGJvy/HiqnnlHCBS5n1+AWuO8i2eHWaDjKPd9RSfooSjMM5MShhDG8qZuNezzBSXjqqibMLa3B1cWL0yR5A0sJws5gzhSxlMkcGrxz4j7JIj/ya9/iQ+hly+jZMJ0KtDCWftkc1zPliNiJ13xK5ZNpFfID2IRaGhnvvKtlZzJERZPttY1/9/Xlc9cu92Ne29okhhLZNjpkXKBimvGP0gcl8zzjRwa16aewzuzim+vCOrFmNL5m9rUTR92yZcoHh3uorw0fJObzPj5+JranisT+Y7WmDhyslkTlJ
X-MS-Exchange-AntiSpam-MessageData:
	XZ7O2xnHLW5Dak2ojdLUj8wjrlctiPUiLGqhbbKAXhiYpOVkdC8DGS/ugxZhA1sUKXSldB3jNiMO+ZjaDm4HeQiJJ3+w34RVC/XYVV6FaAHF1MLGwv8VVLvnSeM9VZArFSVljBTrKVqxHba8keVGhg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dad00302-2c8d-4801-a89d-08d7a8dde3c3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2020 19:18:46.0123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNIsVRhnXeYI3OMDSkEIqUjnmHTmQ3QxKFCFNO8PIxmOtiYRwQEOefhGSre/BlnuMsEDibKqqzYhIFHztpNi7z1A7RWiQuVrP3WhAo/l8XY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2997
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6EJoAbxXLQF.A.BID.zmHOeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/786
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e4ffe034-b2fa-f7e6-aa5c-e7db55f546b6@virtuozzo.com
Resent-Date: Mon,  3 Feb 2020 19:51:15 +0000 (UTC)

25.12.2019 19:23, Vladimir Sementsov-Ogievskiy wrote:
> 07.09.2019 20:26, Vladimir Sementsov-Ogievskiy wrote:
>> 02.10.2018 18:50, Eric Blake wrote:
>>> On 10/2/18 10:31 AM, Vladimir Sementsov-Ogievskiy wrote:
>>>> Hmm, Eric, what are the plans about this?
>>>>
>>>> Now in upstream discard, write-zeros and block-status are limited in
>>>> client to 32m by default which is too slow.
>>>> Can we make some minimal specification change to drop these strict
>>>> limitations?
>>>
>>> Elsewhere in the thread, back in May:
>>>
>>>>>> So, now we have two very similar options, and in realization - two almost identical code paths.
>>>>>> Are we going to add similar limits for BLOCK_STATUS? and for CACHE? I have an idea: what about some kind of universal option for it? Something like
>>>>>>
>>>>>> option INFO_CMD_SIZE: specific limits for command:
>>>>>>    uint16_t command
>>>>>>    uint32_t min_block
>>>>>>    uint32_t max_block
>>>>>>
>>>>>> and server can send several such options, client can request them in some generic way. Most of semantics for these additional limits are common, so it will simplify both documentation and realization.
>>>>>>
>>>>>
>>>>> We already document "A particular information type SHOULD only appear once for a given export unless documented otherwise." - but this would indeed be a case where we could document otherwise.
>>>>>
>>>>> Do you envision a server that needs to have independent limits for CACHE and/or BLOCK_STATUS beyond the usual limits for READ, where advertising alternative limits is worthwhile?  But the idea of having a single reusable info that documents per-command limits may be worth the effort, so I'll try a v5 of both this patch and of the qemu proof-of-concept implementation along those lines, so that we can compare the two approaches. 
>>>
>>> It's still on my todo list to propose an alternative wording along with a qemu implementation, for the v5 posting of this topic.  However, it likely won't happen until after KVM Forum later this month.
>>>
>>
>> Hi!
>>
>> Investigating our heap of patches in virtuozzo qemu above rhel qemu, I now look at two patches which actually drop these restrictions
>> in client for WRITE_ZERO, TRIM and BLOCK_STATUS. So actually we just live with a bit non-compliant client for more than year due to
>> these restrictions..
>>
>> I didn't answer your question about BLOCK_STATUS: yes, we need large BLOCK_STASTUS requests, as qemu-img convert does additional loop
>> of block status querying before actual converting, and this loop is slowed down because of restrictions. About CACHE I'm unsure, seems
>> we didn't face such problems with it.
>>
>> Do you have plans or ideas on this topic?
>>
>> I think that for BLOCK_STATUS and TRIM we can safely drop max_block restriction at all, documenting that max_block is unrelated to
>> these commands, as actually, for BLOCK_STATUS server may return less then required anyway, and TRIM should never lead to some big
>> allocations or calculations..
>>
>> WRITE_ZERO is a bit trickier, as if it is backed by just writing zeroes, but we can at least drop max_block restriction if FAST_ZERO
>> flag is specified, than client may implement write zero as
>>
>> write_zero(FAST_ZERO)
>> if failed:
>>     writing zero is slow anyway, do it in a loop.
>>
>>
>> So, in other words, can we do something like this:
>>
>>   diff --git a/doc/proto.md b/doc/proto.md
>>   index fc7baf6..4b067f5 100644
>>   --- a/doc/proto.md
>>   +++ b/doc/proto.md
>>   @@ -815,9 +815,12 @@ Where a transmission request can have a nonzero *offset* and/or
>>    the client MUST ensure that *offset* and *length* are integer
>>    multiples of any advertised minimum block size, and SHOULD use integer
>>    multiples of any advertised preferred block size where possible.  For
>>   -those requests, the client MUST NOT use a *length* larger than any
>>   -advertised maximum block size or which, when added to *offset*, would
>>   -exceed the export size.  The server SHOULD report an `NBD_EINVAL` error if
>>   +those requests, the client MUST NOT use a *length* which, when added to
>>   +*offset*, would exceed the export size. Also for NBD_CMD_READ,
>>   +NBD_CMD_WRITE, NBD_CMD_CACHE and NBD_CMD_WRITE_ZEROES (except for
>>   +when NBD_CMD_FLAG_FAST_ZERO is set), the client MUST NOT use a *length*
>>   +larger than any advertised maximum block size.
>>   +The server SHOULD report an `NBD_EINVAL` error if
>>    the client's request is not aligned to advertised minimum block size
>>    boundaries, or is larger than the advertised maximum block size.
>>    Notwithstanding any maximum block size advertised, either the server
>>
>> ?
>>
>> Or it will make existent nbd servers non-compliant? At least seems qemu nbd server never forced these restrictions
>> in specified cases.
>>
>>
>> And, additional idea: can we in qemu just ignore these restrictions up to first EINVAL returned? So, for example,
>> we start with bs->bl.max_pwrite_zeroes = INT_MAX, we send WRITE_ZEROES with length exceeding max_block, if server
>> replies with EINVAL we retry current request using limited length (we have to do it in a loop) and set
>> bs->bl.max_pwrite_zeroes = max_block.
>>
>>
> 
> Eric? Now, I'm investigating the heap again, and remember of this talk:) What do you think?
> 

Any ideas?

-- 
Best regards,
Vladimir

