Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C601B46B1
	for <lists+nbd@lfdr.de>; Wed, 22 Apr 2020 15:57:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4939D203ED; Wed, 22 Apr 2020 13:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr 22 13:57:09 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MSGID_FROM_MTA_HEADER,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0E8FB202B9
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Apr 2020 13:41:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.92 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MSGID_FROM_MTA_HEADER=3, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vTN8BxYmp5xo for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Apr 2020 13:41:01 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .virtuozzo. - helo: .eur04-he1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0730.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::730])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9F2AA2017B
	for <nbd@other.debian.org>; Wed, 22 Apr 2020 13:41:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beT2U8hybt+EtRnUtdksZlc/IE/DBJ5+SAfK5wUVOsDwkWvyA+1Lij6SgDvypvlljFZj1CKdAM+2s2Al2+d6/hNimXNZ7CRtuYVPt53DpAgSVOESrtgYY2Wk47kLKTjMNWVwT2kmeG2KcPnRD9Z4yt4vPclCcfnxxhgzoi9OqHKAcQeb6u7XOkuLtzwam/f/WQkuaaWgIiVpOTLKZ/G92f5ROPiCPWewpZToMqEQ01mtzjOzVc1OlTK0ywJHnrylqxKo7sMD4Y6r9y6GGZ2cMQdcLVGplFq8Ogwt1zTuNWGUSU1u8J7B8SA0dgML7vefqRWpdl9A2BrFzV4YwIfvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N90ij9I3aMxSom32ur2R+3j22BHy/89ClST1U38lUrw=;
 b=gPTIxaVMNqQ8a3wdSOmCU1jCAymwrz8Vf8WZfGi+YKAsBpl3B/PbgjaB198z576FOHgYx0n7N81D1mZ8B7qy3OjT4TY7BJAPR6GoEjfeur45RBH0fRi4s2Wd49/z3vV9VVgqJPHlmrv2DwNjodhU2c9JuJxrumJ2krGEW5zplkcH2DIMwqztlT/CUbU0ZMUwchsi9gf0prZNtqStu8cj5E0BnKm28tZU8Pgkw0GfPWyfOdWP8i9wBtCpIPs9yz1xW5aVX03qbIs4jbCOVVJqJulI2pkH/TNtb+XiI2oyT8xhwi6CyAq0/iHACAPKtPltuenOtRSFhVNAo3tGyHbK/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N90ij9I3aMxSom32ur2R+3j22BHy/89ClST1U38lUrw=;
 b=V0CANc441gMQcSi17W6BxDoKP9jd/o7czIhiSafb3F/hkSVKt+dOe59Vdvzb/svwBXZYsdSiGqAu7ZOrsm0psW5/zxW2EEaGXqgZR/VzRgShUi5LPdTOrN1Q7VLJ+T9CWH5ORkAVaA8tSGWMU/z0mtKZgZD2Wbuzf1343QWg+zI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Wed, 22 Apr
 2020 13:06:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::acfa:5:88c8:b7b9]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::acfa:5:88c8:b7b9%3]) with mapi id 15.20.2937.012; Wed, 22 Apr 2020
 13:06:18 +0000
Subject: Re: [RFC v2] nbd/proto: introduce extended request and 64bit commands
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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
 <aa65119c-f46d-3b48-2f3c-1e69942ef283@virtuozzo.com>
X-Tagtoolbar-Keys: D20200422160616505
Message-ID: <4b584bc4-a1c0-425e-de31-9ed9f7a5cada@virtuozzo.com>
Date: Wed, 22 Apr 2020 16:06:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <aa65119c-f46d-3b48-2f3c-1e69942ef283@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR01CA0113.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.2] (185.215.60.157) by AM0PR01CA0113.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Wed, 22 Apr 2020 13:06:17 +0000
X-Tagtoolbar-Keys: D20200422160616505
X-Originating-IP: [185.215.60.157]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ddca352-89f1-44a0-a372-08d7e6bdf207
X-MS-TrafficTypeDiagnostic: AM7PR08MB5399:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB5399A0FC5D8306A5BFDD4B40C1D20@AM7PR08MB5399.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-Forefront-PRVS: 03818C953D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5494.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(376002)(39840400004)(136003)(396003)(2616005)(86362001)(6486002)(2906002)(31696002)(8676002)(66946007)(4326008)(66556008)(66476007)(107886003)(5660300002)(81156014)(8936002)(16526019)(956004)(31686004)(110136005)(52116002)(316002)(36756003)(186003)(478600001)(16576012)(53546011)(26005);DIR:OUT;SFP:1102;
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	14cS6bV33BtEEU2g4sxzbvECBUEOMxHcK+7WzLyfaK977kWuztZ1hcIwmLuYK7nWr2/edKJu1oVYeGE/t1/Hm0aSeQbQcVEMDebQfFh0SICEfYspp34MkwO5iszCGsReHTPR9tBci/qwZMp81p0AXdc4AmSNmBxzng3GkceMAL3ks2kqlc3AMnbZxve0iVX+/QRfJhLkPI79P6btZ+UKLGX/KmsRFtAtr1WFXRcww+uUcS8xRFrUrlTHP4EAv1u6Xc01S5sj5AxLFJqtfpO678yuU1rEClEZk+/HTBobo5Gnp1BUN/2LnLl25v38RuZBhwNVkybZ2KA3pmqHMOxLtb3sd+5mjv632I1/uJciZ9GEidjyQACTIzBjyxxaXt5rtwY/c3Z3jixSd9YO+/iU1YAbMy3vDZEqozRfEmLq4s4pToew08XIMQN3QSQp73CK
X-MS-Exchange-AntiSpam-MessageData:
	dmJrEq1k7YGapcN7ib6VWX2DihfM499JlV10fQfrLSKi4QeqvXl5UQ/sr2cTRvmfo1jlO+on1RAXFZdART3uY0gdQqzCKuLoY37DMpKIS1rQ/EgERz6mjJTBVMKndW3FOXdL3DJmT0TFgYKtXP42lA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddca352-89f1-44a0-a372-08d7e6bdf207
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2020 13:06:18.1970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZeGmm4ZYWRQxgGJtWarl66QlqcPJImPOyErd98atjSnfthOA1FPUrL1C7wL820tOMfpYT+4ISsqXqXmJZD5OLO+voh7LytAnEh4N805oB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <PuStNtrIsXJ.A.EBE.10EoeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/875
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4b584bc4-a1c0-425e-de31-9ed9f7a5cada@virtuozzo.com
Resent-Date: Wed, 22 Apr 2020 13:57:09 +0000 (UTC)

18.03.2020 16:10, Vladimir Sementsov-Ogievskiy wrote:
> 18.03.2020 15:22, Eric Blake wrote:
>> On 3/18/20 3:04 AM, Wouter Verhelst wrote:
>>> On Wed, Mar 18, 2020 at 09:19:45AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>>> OK, understand. Reasonable thing, agreed. I'll resend.
>>>>
>>>> Hmm. But we can't read in one go anyway, because we need to distinguish NBD_REQUEST_MAGIC
>>>> from NBD_EXTENDED_REQUEST_MAGIC..
>>>
>>> Yes, that needs to happen at any rate, indeed. So the difference will be
>>> two reads rather than three, instead of one read rather than two.
>>>
>>> That's still an advantage.
>>
>> Not much of one.  You're micro-optimizing the read()s, but in reality, the sender will likely send() the entire packet at once, at which point the data is in the kernel and the reads will succeed back-to-back, or you can even write the client to read into a buffer to minimize syscalls and then parse as much as needed out of the buffer.
>>
>> You've got a LOT more overhead in the TCP packet and network transmission time than you do in deciding whether the server has to do 2 or 3 read()s per client message.
>>
>> While it might be nice to design a message that doesn't need the server to do additional decision points mid-packet in determining how much packet remains, that should not be your driving factor. Even with current servers, that is already the case (the server has to decide mid-packet whether it is handling NBD_CMD_WRITE and thus has more data to read).
>>
>>>
>>>> I think, that modern client will use mostly NBD_EXTENDED_REQUEST_MAGIC interface, so it will
>>>> be great to optimize it. But to read extended request in one go, we should make it
>>>> shorter than simple request, and it doesn't seem possible.
>>>>
>>>> May be we should not support simple and extended requests together? May be better to force
>>>> using only extended requests if they are negotiated? Then we will read extended request in
>>>> on go, and we may just define it like
>>
>> As extended requests already have to be negotiated, and no client nor server exists yet that supports them, we can indeed declare that on successful handshake of the new feature, a client may ONLY send extended requests.  However, a server already has to handle both packet types (if the client doesn't request the feature) and a client already has to be able to send both packet types (for fallback when talking to a server that lacks the feature), so what does it buy us to require that when the feature is negotiated, only extended packets may be sent?  I guess it boils down to whether the server implementation is simplified or made more complex, depending on whether we state that once negotiated both packet types are allowed (server must decide on a per-packet basis which type it is receiving) or whether only extended packets are allowed (server must now be more stateful in order to reject an ill-behaved client that sends wrong type).  In fact, I argue that a server that 
>> replies to an extended packet even when an ill-behaved client that forgot to negotiate them is a reasonable server implementation (the client can't depend on that behavior, though).
> 
> Hmm, so the restriction doesn't help us, as we'll any way try to handle "wrong" type of the message.. Then, we, any way, will have two reads for extended request (if it is larger than simple request), as on first we should understand is it extended or not. So, I again don't see any benefit in forcing offset and length to be in the header, it's just less portable for the future.
> 
> So, if we go with my proposal as is, how will it work?
> 
> Smallest extended request is of 20 bytes length. Simple request is 28 bytes..
> 
> So:
> 
> 1. read 20 bytes
> 
> 2. if extended, read the tail defined by length
>     else, read the tail, corresponding to simple request
> 
> - we always have two reads.
> 
> ===
> 
> If we extened extended request headers by some fields, we can only optimize simple request, so it will be
> 
> 1. read 28 bytes
> 
> 2. if simple WRITE read corresponding tail
>     if another simple request - we are done
>     if extended, read corresponding tail. - For this, payload_length field should be placed in first 28 bytes, so it can't follow offset and bytes fields.
> 
> So, it will look like
> 
> C: 32 bits, 0x23876289, magic (`NBD_EXTENDED_REQUEST_MAGIC`)
> C: 16 bits, flags
> C: 16 bits, type
> C: 64 bits, handle
> C: 32 bits, length of payload (unsigned)
> C: 64 bits, offset
> C: 64 bits, length of requested region
> C: *length* bytes of payload data (if *length* is nonzero)
> 
> which is again, a bit strange, and the only benefit is one read instead of two on simple request handling (except for WRITE), when most of requests will be extended anyway.
> 
> So, I'm for first scheme and my original proposal, as it is more flexible for future extensions.. Hmm about non-offset-size commands:
> I can imagine Qemu extension, which will export qapi block-layer interface through NBD, why not?
> 


Ping? What do you think? Can we proceed with my patch as is? Or I didn't convince you?


-- 
Best regards,
Vladimir

