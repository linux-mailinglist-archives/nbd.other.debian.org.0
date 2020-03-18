Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CC8189D30
	for <lists+nbd@lfdr.de>; Wed, 18 Mar 2020 14:42:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9366B207DE; Wed, 18 Mar 2020 13:42:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 18 13:42:20 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MSGID_FROM_MTA_HEADER,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4E474207C1
	for <lists-other-nbd@bendel.debian.org>; Wed, 18 Mar 2020 13:26:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MSGID_FROM_MTA_HEADER=3, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dfQ5H_39PxHu for <lists-other-nbd@bendel.debian.org>;
	Wed, 18 Mar 2020 13:26:10 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .virtuozzo. - helo: .eur04-he1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
X-Greylist: delayed 16624 seconds by postgrey-1.36 at bendel; Wed, 18 Mar 2020 13:26:10 UTC
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70139.outbound.protection.outlook.com [40.107.7.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 62F42207BE
	for <nbd@other.debian.org>; Wed, 18 Mar 2020 13:26:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbYYQAGLkM2g9CpC658BTp+6O5rh4PG5qHvQr8KeLR6ixjR0dISg5zibPtvb3wU1W00xfcror66s/1W8gobnugY5s1VxiYc/UZ0ZQnJF8nF1szcmCYaoruxkcvR2SHDN17iXHQyM3AMMlR2vu8a2ZlbbChpWpZx1GuqdlHCEBFNLjKg9i9ZQ25fqbIjrvMXuuxMlQV3KeOx8aZY9/juqbbAYOaQvmJNhltR+KU3dG/9CLuSh/yaJ0XVzOyC0iLYeVvzec0HEA9FsHBOiBomQiGm0heYqGBv2euDfw4bzrWuyiOlZQCoEhWrS21aeqnSffzGWAL3KnoaCwgSimkx8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jB5/N4Gxy9ovOFw1Ti3h2dGzGakE2VNWdVFe0O+YLas=;
 b=Maz4xWxH75qVICLX3OGbe89K0zXWKXxqfIMh/t7jjrC+exdIXYzbJVAsRFNPeZmghE9rjIJTCFu+A39sti5iUZSUXh86vneKwmvK4GLvwmV0HEmaLMWiKxoTUVI1tZSlTNAybIiqysFVAer10G7mcMpVxYuM+rjP+svmmV86GjYFYL1WcOm3Lpvt8vJ5f5tSP1VNHzZMv+d2Qw9Pt26YSYbaDJrQXywBp3lYTkinCPsRjPzM5WYDEJplv+uBAAAWqg8xTmBWqXGa0AjmaRBcLsWoIVzoBXKWqobEbUNKlmnABIzpxdUXjGUX7J2nXx7hkxVPMNbN+GCMC39g/j43SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jB5/N4Gxy9ovOFw1Ti3h2dGzGakE2VNWdVFe0O+YLas=;
 b=idHvKpe3fUad0Vqj643PTHlDeGUk/Or0p8QbgPQT+yM0Mt45EozKwyvVv33+dBeW5QxImMydEe9vL6sSDbwbjGMOpveCg7uvRgM8X40eNyYeRunF16HJLceEGWXzV6H7pLxkcNWd+qYKlk454M2bxQ3gDVZvrdCpF0I5SO0nXNQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com (10.175.35.136) by
 HE1PR0802MB2217.eurprd08.prod.outlook.com (10.172.127.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Wed, 18 Mar 2020 13:10:53 +0000
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f]) by HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f%12]) with mapi id 15.20.2835.017; Wed, 18 Mar
 2020 13:10:53 +0000
Subject: Re: [RFC v2] nbd/proto: introduce extended request and 64bit commands
To: Eric Blake <eblake@redhat.com>, Wouter Verhelst <wouter@grep.be>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, w@uter.be,
 nsoffer@redhat.com, den@openvz.org
References: <20200206151547.5812-1-vsementsov@virtuozzo.com>
 <2f56c11f-3380-9b83-6873-2ec8f4c3d07d@virtuozzo.com>
 <20200317161859.GD27056@grep.be>
 <fd6a5d69-36da-bb4f-b67d-44ef80577a88@virtuozzo.com>
 <20200318053337.GE27056@grep.be>
 <49e18291-7e7b-a363-c807-80d4cc589fd8@virtuozzo.com>
 <78efe37b-b54b-cc59-aec2-1ce39ec1676b@virtuozzo.com>
 <20200318080454.GH27056@grep.be>
 <f4f52b87-5520-4b8c-1b1d-2e681e1ff514@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200318161050800
Message-ID: <aa65119c-f46d-3b48-2f3c-1e69942ef283@virtuozzo.com>
Date: Wed, 18 Mar 2020 16:10:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <f4f52b87-5520-4b8c-1b1d-2e681e1ff514@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0034.eurprd04.prod.outlook.com
 (2603:10a6:208:122::47) To HE1PR0802MB2507.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.2] (185.215.60.249) by AM0PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:208:122::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.21 via Frontend Transport; Wed, 18 Mar 2020 13:10:52 +0000
X-Tagtoolbar-Keys: D20200318161050800
X-Originating-IP: [185.215.60.249]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 049b6791-4957-4781-ab76-08d7cb3dc973
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2217:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2217011D7210A3C654FD377DC1F70@HE1PR0802MB2217.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report:
	SFV:NSPM;SFS:(10019020)(4636009)(366004)(39850400004)(346002)(376002)(396003)(136003)(199004)(110136005)(16576012)(478600001)(316002)(53546011)(52116002)(4326008)(6486002)(31696002)(107886003)(86362001)(8936002)(36756003)(8676002)(2906002)(31686004)(26005)(186003)(16526019)(2616005)(956004)(5660300002)(81166006)(81156014)(66476007)(66946007)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR0802MB2217;H:HE1PR0802MB2507.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zVuhgEX/jhRxBtdutbYz73hEjytLAhEADYlCeQzNfE4PphnCnvf7JDjXlIs/xP9zC9QvGxB7GIbVV7ghT2yx7o5NA8gd+4UEs2vx/fTpzGrREZsOtBlcqHyUHzzo8H1QfxgP50kUyHG2qpugZAdgnbGsqX9xF2wqyBZMXrDe4POWY3bZAB9yj/3IyioYiaotEgVa12EJVIHoo/ccPboVYm3/G9MQE3kKX/HMvcIeS1eZPUdNJuz/rMx9JAk6FVNEv8aWz3FWmRYOX6gIIUcYBuo0MZk2sQyCrjzMXOGIGAd11oPEUsdbkZcXemdteQPcn7YMYwAsDr8AoELrpvZeLF7efdAJVEKJnEmexXpQA7B2+fUC9g3aL2QniL5/KWu+/QbNm4tuJfMqpx78+LgTCCMKm2aoGTi+OMMQjuX29NTjag4+fKBfLpeK68Ot4o5m
X-MS-Exchange-AntiSpam-MessageData:
	PR48rPlHmPx5Xh2CHUZxjAmtbC6nQfvL5hrpx40TZDTIzvhcFyN8wgCQpEfCI1OOFlTzns0l8RXHhduarisYhE4uhPfJg9eFW3PZk6IU1xrI1CvHeBIxZp3mwBnHoZd4ja7q2BNeEVo+AyZfDO7gaw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049b6791-4957-4781-ab76-08d7cb3dc973
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 13:10:53.3797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYqpFfKS0fwILSYQWLJyUvV5PAEC3G71B7Zu05O5eRl7HPDjrpBncWlhMhF72lq57rTVnxXC1mm5gZ8/hUcrbrOhE3k6CMxeslabxvVLQJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2217
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SKhovnyzj3I.A.WRF.8UiceB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/867
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aa65119c-f46d-3b48-2f3c-1e69942ef283@virtuozzo.com
Resent-Date: Wed, 18 Mar 2020 13:42:20 +0000 (UTC)

18.03.2020 15:22, Eric Blake wrote:
> On 3/18/20 3:04 AM, Wouter Verhelst wrote:
>> On Wed, Mar 18, 2020 at 09:19:45AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> OK, understand. Reasonable thing, agreed. I'll resend.
>>>
>>> Hmm. But we can't read in one go anyway, because we need to distinguish NBD_REQUEST_MAGIC
>>> from NBD_EXTENDED_REQUEST_MAGIC..
>>
>> Yes, that needs to happen at any rate, indeed. So the difference will be
>> two reads rather than three, instead of one read rather than two.
>>
>> That's still an advantage.
> 
> Not much of one.  You're micro-optimizing the read()s, but in reality, the sender will likely send() the entire packet at once, at which point the data is in the kernel and the reads will succeed back-to-back, or you can even write the client to read into a buffer to minimize syscalls and then parse as much as needed out of the buffer.
> 
> You've got a LOT more overhead in the TCP packet and network transmission time than you do in deciding whether the server has to do 2 or 3 read()s per client message.
> 
> While it might be nice to design a message that doesn't need the server to do additional decision points mid-packet in determining how much packet remains, that should not be your driving factor. Even with current servers, that is already the case (the server has to decide mid-packet whether it is handling NBD_CMD_WRITE and thus has more data to read).
> 
>>
>>> I think, that modern client will use mostly NBD_EXTENDED_REQUEST_MAGIC interface, so it will
>>> be great to optimize it. But to read extended request in one go, we should make it
>>> shorter than simple request, and it doesn't seem possible.
>>>
>>> May be we should not support simple and extended requests together? May be better to force
>>> using only extended requests if they are negotiated? Then we will read extended request in
>>> on go, and we may just define it like
> 
> As extended requests already have to be negotiated, and no client nor server exists yet that supports them, we can indeed declare that on successful handshake of the new feature, a client may ONLY send extended requests.  However, a server already has to handle both packet types (if the client doesn't request the feature) and a client already has to be able to send both packet types (for fallback when talking to a server that lacks the feature), so what does it buy us to require that when the feature is negotiated, only extended packets may be sent?  I guess it boils down to whether the server implementation is simplified or made more complex, depending on whether we state that once negotiated both packet types are allowed (server must decide on a per-packet basis which type it is receiving) or whether only extended packets are allowed (server must now be more stateful in order to reject an ill-behaved client that sends wrong type).  In fact, I argue that a server that 
> replies to an extended packet even when an ill-behaved client that forgot to negotiate them is a reasonable server implementation (the client can't depend on that behavior, though).

Hmm, so the restriction doesn't help us, as we'll any way try to handle "wrong" type of the message.. Then, we, any way, will have two reads for extended request (if it is larger than simple request), as on first we should understand is it extended or not. So, I again don't see any benefit in forcing offset and length to be in the header, it's just less portable for the future.

So, if we go with my proposal as is, how will it work?

Smallest extended request is of 20 bytes length. Simple request is 28 bytes..

So:

1. read 20 bytes

2. if extended, read the tail defined by length
    else, read the tail, corresponding to simple request

- we always have two reads.

===

If we extened extended request headers by some fields, we can only optimize simple request, so it will be

1. read 28 bytes

2. if simple WRITE read corresponding tail
    if another simple request - we are done
    if extended, read corresponding tail. - For this, payload_length field should be placed in first 28 bytes, so it can't follow offset and bytes fields.

So, it will look like

C: 32 bits, 0x23876289, magic (`NBD_EXTENDED_REQUEST_MAGIC`)
C: 16 bits, flags
C: 16 bits, type
C: 64 bits, handle
C: 32 bits, length of payload (unsigned)
C: 64 bits, offset
C: 64 bits, length of requested region
C: *length* bytes of payload data (if *length* is nonzero)

which is again, a bit strange, and the only benefit is one read instead of two on simple request handling (except for WRITE), when most of requests will be extended anyway.

So, I'm for first scheme and my original proposal, as it is more flexible for future extensions.. Hmm about non-offset-size commands:
I can imagine Qemu extension, which will export qapi block-layer interface through NBD, why not?

> 
>>>
>>> C: 32 bits, 0x23876289, magic (`NBD_EXTENDED_REQUEST_MAGIC`)
>>> C: 16 bits, flags
>>> C: 16 bits, type
>>> C: 64 bits, handle
>>> C: 32 bits, length of payload (unsigned), MUST be greater or equal to 16
>>> C: *length* bytes of payload data (if *length* is nonzero)
>>>
>>> - so, we'll just read 36 bytes in one go, and then additional payload, if length
>>> is more than 16.
>>
>> That is, certainly, also an option, although I would define length of
>> payload to not include the offset and length bytes.
> 
> Agreed - mixing header length into the length of the payload field makes life a bit more confusing.  I'd rather have the length field be 0 when sending a minimum-sized extended request packet.
> 



-- 
Best regards,
Vladimir

