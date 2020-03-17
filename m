Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B1064188D8E
	for <lists+nbd@lfdr.de>; Tue, 17 Mar 2020 20:00:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3533520674; Tue, 17 Mar 2020 19:00:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 17 19:00:15 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MSGID_FROM_MTA_HEADER,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6506820609
	for <lists-other-nbd@bendel.debian.org>; Tue, 17 Mar 2020 18:44:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MSGID_FROM_MTA_HEADER=3, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fobkbL9WRjno for <lists-other-nbd@bendel.debian.org>;
	Tue, 17 Mar 2020 18:44:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .virtuozzo. - helo: .eur04-vi1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80098.outbound.protection.outlook.com [40.107.8.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id EF8FE205ED
	for <nbd@other.debian.org>; Tue, 17 Mar 2020 18:44:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Um+HnxPvG3boGadZQ8Lgxee2Bv+JAzBO4/KJR8vpo/i7n0ow/yPr18MKqC2nZylFziX595PEe17n2ea6qJBd1c95eNZvxjpoYZBBSOEh+gOz2EA9SzI/ONuO5uw5iK9nC53MVwgvO4weT3Jg7lI05YgpEG+IdoncmN4Dcbn1m+osmp5ESKCQkKDJdoTwGK3w4o9Lpd+plr2rQeTsUiGJSxRn7L1V5J+z77xrF6cFwDOH+yFjR9SUKRl8DVSydsibGNkBPpf4jX0TfFg+0om5guKBxyiH08urrF0/KAI9bwV1zHXW/oTleZhd18uNdo7qJFsz9Nh94N4FXUQFRgUFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UI/dxkpC2V/Fx4zsH6iXgLrv6pMMkDKS1td76PxIvw=;
 b=jy/T5aY+L4Q0CYu6pA+SsW9mjjDzzqWEE+5Vw8QixGxJua30JpPGPADgIuHLt8e9L0mFxG4j/7Sz/AaaeIsARbQ2pV907b2Ywe25XTNS32FHxIuK3HVUfjEJvZvTgEsBJwUbFuTA8hKZkgvx74rfovEocV6AaGmilDiS2DCmqu0ALkcxBNgimo2jLmiVL71n5KvTMHFpc++bzpBTLj6Bo3hkQMyPvcKydFxc7Vn9wrNnvY14dCbg4OiErm7vjosDd/p52e+RHY0/j/sIlrSDNpwUIOgA/qxgmNoMqPvGtcl28v+BWPPKTY05zF697fR6k8PNHGVnTKaNsKqZM+fofA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UI/dxkpC2V/Fx4zsH6iXgLrv6pMMkDKS1td76PxIvw=;
 b=GCTxzp2SSumDHewpsGhA4Yk8V17JmBk1EDuoLpNHZ9fcZLVgkxoeEeCKjuKMK3NmEwoSHDQTzC1NiSv+4WJq6zcLC+zZfFyu2JBWuhD2OApnJu3krrX4sHiMbBcjMCmSQ/pllNbelT57g9nbzl6G/wyDnZho0mzNzTRdOB+TFN4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com (10.175.35.136) by
 HE1PR0802MB2426.eurprd08.prod.outlook.com (10.175.35.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.14; Tue, 17 Mar 2020 18:10:42 +0000
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f]) by HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f%12]) with mapi id 15.20.2814.021; Tue, 17 Mar
 2020 18:10:42 +0000
Subject: Re: [RFC v2] nbd/proto: introduce extended request and 64bit commands
To: Wouter Verhelst <wouter@grep.be>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, eblake@redhat.com,
 w@uter.be, nsoffer@redhat.com, den@openvz.org
References: <20200206151547.5812-1-vsementsov@virtuozzo.com>
 <2f56c11f-3380-9b83-6873-2ec8f4c3d07d@virtuozzo.com>
 <20200317161859.GD27056@grep.be>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200317211032912
Message-ID: <fd6a5d69-36da-bb4f-b67d-44ef80577a88@virtuozzo.com>
Date: Tue, 17 Mar 2020 21:10:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <20200317161859.GD27056@grep.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::18) To HE1PR0802MB2507.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.2] (185.215.60.248) by ZR0P278CA0008.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14 via Frontend Transport; Tue, 17 Mar 2020 18:10:40 +0000
X-Tagtoolbar-Keys: D20200317211032912
X-Originating-IP: [185.215.60.248]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90b377ed-7635-4f23-6c59-08d7ca9e80ec
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2426:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
 <HE1PR0802MB2426D298D12D488DDB224E13C1F60@HE1PR0802MB2426.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0345CFD558
X-Forefront-Antispam-Report:
 SFV:NSPM;SFS:(10019020)(4636009)(39850400004)(396003)(346002)(136003)(376002)(366004)(199004)(316002)(8936002)(16526019)(478600001)(8676002)(52116002)(81156014)(186003)(6666004)(26005)(16576012)(31686004)(6916009)(81166006)(36756003)(5660300002)(31696002)(66556008)(66476007)(66946007)(956004)(86362001)(2616005)(2906002)(6486002)(107886003)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR0802MB2426;H:HE1PR0802MB2507.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
 8TzhGfDgPxRLZwV0xgh8oGoZjjEz1v1pd5LtPIfPn723zes6ZTpDFPuRCyRAftA9JNG5MDDMYXbE9AgGy8bQTD1ac1GrtnRG2aIYWZ113bZgg7rg2ZExRTPRBguByv6ZafqBfcBiLbIdvmsPWvdhCGVbj/qrDTVg/oml60Mm2il/agSCT21qpDu0M2Wuf//TpMcHR6GoEDg1VJVfw2i52U4XiYvPVHJ7o0KXinyVcd0Q07zz1n5ZFNOCxdMNAbkfD8G3vZe3/okTcyJcTQQ0vSVFfmXESd4JcYQTiMhgrEd7VKO2EEJMOKc/q48KvHZ3GXG/ZBpW2TmiERkTQ23fJrFKRpVYs+vwJyTKuTTFSr4EtRnN3c4tDbJjsLd76K2GjRc+xySO6XUvA7ztlPpNVnB+cCUvxVGFYMhtHuyI2jYyvEqtHEaMXTffWYEtX8tk
X-MS-Exchange-AntiSpam-MessageData:
 NdjECKqaeHNoo/kEk/DC+HI/SiRik2zdr+s5Q3G8K/LMF7TIix95lbxJG1zjldWz8Iu6nCDeVj2VamaCHf5n7x+0+L0brJU+aNuuetnSQYpVpgzoEFTzXT+qM0mnLiXAbJcaq5cISgRUPhU2+yvZkQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b377ed-7635-4f23-6c59-08d7ca9e80ec
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 18:10:41.8583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRZY3fAdtJQxceISbondGXgG/GelxzU+prVdowbjb9yYauYyxh5/oZTrx5FBD8CIuo7kR8erEjmS0M72H9ftMxw07yMk8PvJVr/tSoDhedc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2426
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_bhQPtF9kFL.A.9N._4RceB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/860
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/fd6a5d69-36da-bb4f-b67d-44ef80577a88@virtuozzo.com
Resent-Date: Tue, 17 Mar 2020 19:00:15 +0000 (UTC)

17.03.2020 19:18, Wouter Verhelst wrote:
> Hi Vladimir,
> 
> Sorry for the delay; I got married late last month (yay!), so obviously
> I was a little preoccupied ;-)

Congratulations!! Be happy!

> 
> On Fri, Feb 28, 2020 at 01:22:43PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> ping
>>
>> 06.02.2020 18:15, Vladimir Sementsov-Ogievskiy wrote:
> [...]
>>> +The extended request message, sent by the client, looks as follows:
>>> +
>>> +C: 32 bits, 0x23876289, magic (`NBD_EXTENDED_REQUEST_MAGIC`)
>>> +C: 16 bits, flags
>>> +C: 16 bits, type
>>> +C: 64 bits, handle
>>> +C: 32 bits, length of payload (unsigned)
>>> +C: *length* bytes of payload data (if *length* is nonzero)
> [...]
>>>        A client MUST NOT send a trim request unless `NBD_FLAG_SEND_TRIM`
>>>        was set in the transmission flags field.
>>> +    `NBD_CMD_TRIM` supports extended requests, with the following
>>> +    16-bytes payload:
>>> +
>>> +    64 bits: offset
>>> +    64 bits: length
>>> +
>>>    * `NBD_CMD_CACHE` (5)
>>>        A cache request.  The client is informing the server that it plans
>>> @@ -2095,6 +2127,12 @@ The following request types exist:
>>>        including one or more sectors beyond the size of the device. It SHOULD
>>>        return `NBD_EPERM` if it receives a write zeroes request on a read-only export.
>>> +    `NBD_CMD_WRITE_ZEROES` supports extended requests, with the following
>>> +    16-bytes payload:
>>> +
>>> +    64 bits: offset
>>> +    64 bits: length
>>> +
>>>    * `NBD_CMD_BLOCK_STATUS` (7)
>>>        A block status query request. Length and offset define the range
>>> @@ -2154,6 +2192,12 @@ The following request types exist:
>>>        `NBD_EINVAL` if it receives a `NBD_CMD_BLOCK_STATUS` request including
>>>        one or more sectors beyond the size of the device.
>>> +    `NBD_CMD_BLOCK_STATUS` supports extended requests, with the following
>>> +    16-bytes payload:
>>> +
>>> +    64 bits: offset
>>> +    64 bits: length
> 
> I can't actually think of any command that would not require offset and
> length fields; and given my quote, it would appear neither can you.

Hmm. What about RESIZE? May be, some kind of REOPEN..

> 
> Given that, wouldn't it make more sense to have the offset and length
> fields be part of the extended request message, and to keep the payload
> empty for messages that don't actually send any data along? That would
> make the handling for such messages easier to do, too. In other words,
> make the extended request message have a magic, flags, type, handle,
> payload length, offset, and "affected length" field, and leave payload
> for actual data.
> 

But why not to keep it more portable? What is a benefit? I see the drawback:
if we define it with offset/length, than, when we'll want to implement a new
command without them, it will be incompatible extension..

> If somehow we do end up with a message that does not need the offset or
> length fields, we can then always mark those as reserved and make the
> server ignore them.
> 

We may just invent a name for offset/lenght extended requests, something like
"standard extended request", and instead of

 >>> +    `***` supports extended requests, with the following
 >>> +    16-bytes payload:
 >>> +
 >>> +    64 bits: offset
 >>> +    64 bits: length

several times we'll have just

 >>> +    `***` supports standarad extended requests

And we'll need additional paragraph, defining standard extended request, including
its layout (64 bits offset and 64 bits length).

...

Or what you mean by "reserved"? Just treat commands with no offset/length as unknown
commands? But this adds nothing to the spec actually.

So, do you mean, document that all extended commands have offset and length, but note
that "in future, new commands may be added without these fields" ?

-- 
Best regards,
Vladimir

