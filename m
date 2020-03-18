Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED271895EE
	for <lists+nbd@lfdr.de>; Wed, 18 Mar 2020 07:39:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 68E43205C6; Wed, 18 Mar 2020 06:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 18 06:39:09 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MSGID_FROM_MTA_HEADER,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 422D42044F
	for <lists-other-nbd@bendel.debian.org>; Wed, 18 Mar 2020 06:23:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MSGID_FROM_MTA_HEADER=3, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HuEqlQSfpdVh for <lists-other-nbd@bendel.debian.org>;
	Wed, 18 Mar 2020 06:23:28 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .virtuozzo. - helo: .eur04-he1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
X-Greylist: delayed 1107 seconds by postgrey-1.36 at bendel; Wed, 18 Mar 2020 06:23:28 UTC
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0701.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7BBA820441
	for <nbd@other.debian.org>; Wed, 18 Mar 2020 06:23:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7WvUpkqv11W5u30c3udpzl3wfMrQnOLqJ+gGKJeCvKGKQO/gfymiy9PKjGe6PeKRoHvsw2cCOAC+QhqtX7AqGIfeBynoWtInSGaONC3JpzVD3DSuIyBD3hjWTtPlT3x6Xfdb70wXdftj24cUKImb8mfDgTuG0uX3tnhhke1ZScBB4SYCOPmILvj4ZzRrXMmonUsXsvqEZeZOje///FOupF4slGrLm+rTTzXF1IOYJQly4J5X2TI95GsGBWlA4bJkLlg1ehFRADD/OLYzeHxuMGxkHrOjd6m6wX5UJ/QfS2G9mkBe4Rith5mLJN661ldzFBXEWa/9VAUwzwlS6QTqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UT1ghrpan0cmEL/xrC/ExzdKdj87gGwwnQWb/TpAqQ=;
 b=X16ejpaj06aYI4ULI50GjW9fSpzWUHIsjeB7hEcTClRudI5HI9YKW5Chxp2EabkSF6DMfxPrzVAegpP1f+8q3txP0I9uA0B+9KTVg4SSYHu5PkF6836CGnoUTszjn/CHJSiKazd/x7BIn/na3idqye4pUtM/g7icUdWpb5zlVx2sACv1QsMNtQTpGkGkENvUWcod15Gck5Vm+cpKaIKYWxYXHhEz96Qlbe3gTeS1qw4GZ/PFqTDImRfPINE7PZBK2+dqH35pcDm+eDaqTWLnRFD5ripDlxnp+ur07+YQQPGlY45dYh744QmS60Y0K09r4iG85D2CjIi5hiXxehHtkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UT1ghrpan0cmEL/xrC/ExzdKdj87gGwwnQWb/TpAqQ=;
 b=Z+QjByXS+HFCblBlmJyejFpgJSNWoKB6AgY7srmJ4KcWAbUt3rO5xyTuC96MOfiMsh0HcT9K2RDYHWhBH7JrCPbj+y7BCBQLvjhty7bRkV1TgVMj6QjOV6lk/m+gQLt83MEB77hKzU6pufxX33w16mDA+mIGrZXzofJJD1xhAVw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com (10.175.35.136) by
 HE1PR0802MB2473.eurprd08.prod.outlook.com (10.175.34.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Wed, 18 Mar 2020 05:49:24 +0000
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f]) by HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f%12]) with mapi id 15.20.2835.017; Wed, 18 Mar
 2020 05:49:24 +0000
Subject: Re: [RFC v2] nbd/proto: introduce extended request and 64bit commands
To: Wouter Verhelst <wouter@grep.be>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, eblake@redhat.com,
 w@uter.be, nsoffer@redhat.com, den@openvz.org
References: <20200206151547.5812-1-vsementsov@virtuozzo.com>
 <2f56c11f-3380-9b83-6873-2ec8f4c3d07d@virtuozzo.com>
 <20200317161859.GD27056@grep.be>
 <fd6a5d69-36da-bb4f-b67d-44ef80577a88@virtuozzo.com>
 <20200318053337.GE27056@grep.be>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200318084921640
Message-ID: <49e18291-7e7b-a363-c807-80d4cc589fd8@virtuozzo.com>
Date: Wed, 18 Mar 2020 08:49:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <20200318053337.GE27056@grep.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR05CA0087.eurprd05.prod.outlook.com
 (2603:10a6:208:136::27) To HE1PR0802MB2507.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.2] (185.215.60.249) by AM0PR05CA0087.eurprd05.prod.outlook.com (2603:10a6:208:136::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.21 via Frontend Transport; Wed, 18 Mar 2020 05:49:23 +0000
X-Tagtoolbar-Keys: D20200318084921640
X-Originating-IP: [185.215.60.249]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c3c0470-29cb-43a2-4094-08d7cb001cac
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2473:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2473ADAEA308F58BEEE58CEAC1F70@HE1PR0802MB2473.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report:
	SFV:NSPM;SFS:(10019020)(4636009)(39850400004)(396003)(366004)(346002)(136003)(376002)(199004)(31696002)(86362001)(6486002)(107886003)(2906002)(66946007)(5660300002)(66476007)(66556008)(6916009)(36756003)(52116002)(31686004)(478600001)(956004)(316002)(16576012)(8676002)(8936002)(4326008)(26005)(186003)(81156014)(16526019)(81166006)(2616005);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR0802MB2473;H:HE1PR0802MB2507.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9eD3fRgKtbzAHxBXP5hDWusM/RKfgjVcrpnkBrUJF5RkHtATlxp7caxhjs3NydYFqENhoeukTOMNTxKVjxnZGIAXMJUdoA71PybxAsx2lc8KgIrFfwWa+szskIEd1dPKer/HRZZXynh1zWLFLKhj1WjQXylAbPyoavhs/xiuBYeUVN+tqU49DBVWoc+IIeiLHmNTvMqrC1I0hWtzV80TDHZhxHrrUxsa+yXIWdZSr/TlP2/RMwydngiVBFNkBF2FkLwcuXD48dX1lSmCpw/ByF73BbeiMj2JkWXPt63FkpFObYlpFzilgC3EsBQnSH+cTI1Y7lEQ0d9hHxdlv5O2JXUNhjbZ2AsgtT1kLLEYUuuZ5BvggFsWd/1D+OL7bxdZHYMU8jS+D/SEvpkrJKGIx1Sf6aszfbMDH5hU/ySwbHVpvola3UEVayMlA0sZnBb7
X-MS-Exchange-AntiSpam-MessageData:
	0i5kBB7ZbAsMdQEXimz7xH3JL+VeX0t1LRGr7EQUp/5fWPn9C2LhZ8IRawNQ/rk2wN1owRpy88uffp5Rid/muGzROy9n50B+ghhllINg0XEbCn9kFLHpyX+JeeC3UGVFXdqh1WSA0dd98yUddKBmIw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3c0470-29cb-43a2-4094-08d7cb001cac
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 05:49:24.4510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DWYQM6dA1p+a6n4y/WG9AnsszMowtl/1t3dj8I6cQQKM7qHPsltoeKsfVfSj3S3OernrpkMCnvYWHAd+V445wo7vNONfmWoZBsFWBBBbyTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2473
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8NUIlFKyl4O.A.0jG.NIcceB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/863
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/49e18291-7e7b-a363-c807-80d4cc589fd8@virtuozzo.com
Resent-Date: Wed, 18 Mar 2020 06:39:09 +0000 (UTC)

18.03.2020 8:33, Wouter Verhelst wrote:
> On Tue, Mar 17, 2020 at 09:10:32PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 17.03.2020 19:18, Wouter Verhelst wrote:
>>> Hi Vladimir,
>>>
>>> Sorry for the delay; I got married late last month (yay!), so obviously
>>> I was a little preoccupied ;-)
>>
>> Congratulations!! Be happy!
>>
>>>
>>> On Fri, Feb 28, 2020 at 01:22:43PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> ping
>>>>
>>>> 06.02.2020 18:15, Vladimir Sementsov-Ogievskiy wrote:
>>> [...]
>>>>> +The extended request message, sent by the client, looks as follows:
>>>>> +
>>>>> +C: 32 bits, 0x23876289, magic (`NBD_EXTENDED_REQUEST_MAGIC`)
>>>>> +C: 16 bits, flags
>>>>> +C: 16 bits, type
>>>>> +C: 64 bits, handle
>>>>> +C: 32 bits, length of payload (unsigned)
>>>>> +C: *length* bytes of payload data (if *length* is nonzero)
>>> [...]
>>>>>         A client MUST NOT send a trim request unless `NBD_FLAG_SEND_TRIM`
>>>>>         was set in the transmission flags field.
>>>>> +    `NBD_CMD_TRIM` supports extended requests, with the following
>>>>> +    16-bytes payload:
>>>>> +
>>>>> +    64 bits: offset
>>>>> +    64 bits: length
>>>>> +
>>>>>     * `NBD_CMD_CACHE` (5)
>>>>>         A cache request.  The client is informing the server that it plans
>>>>> @@ -2095,6 +2127,12 @@ The following request types exist:
>>>>>         including one or more sectors beyond the size of the device. It SHOULD
>>>>>         return `NBD_EPERM` if it receives a write zeroes request on a read-only export.
>>>>> +    `NBD_CMD_WRITE_ZEROES` supports extended requests, with the following
>>>>> +    16-bytes payload:
>>>>> +
>>>>> +    64 bits: offset
>>>>> +    64 bits: length
>>>>> +
>>>>>     * `NBD_CMD_BLOCK_STATUS` (7)
>>>>>         A block status query request. Length and offset define the range
>>>>> @@ -2154,6 +2192,12 @@ The following request types exist:
>>>>>         `NBD_EINVAL` if it receives a `NBD_CMD_BLOCK_STATUS` request including
>>>>>         one or more sectors beyond the size of the device.
>>>>> +    `NBD_CMD_BLOCK_STATUS` supports extended requests, with the following
>>>>> +    16-bytes payload:
>>>>> +
>>>>> +    64 bits: offset
>>>>> +    64 bits: length
>>>
>>> I can't actually think of any command that would not require offset and
>>> length fields; and given my quote, it would appear neither can you.
>>
>> Hmm. What about RESIZE? May be, some kind of REOPEN..
> 
> RESIZE would need a length. It would probably not need an offset, that
> is true.
> 
> A REOPEN command could use both if we wanted to support a partial
> reopen.
> 
>>> Given that, wouldn't it make more sense to have the offset and length
>>> fields be part of the extended request message, and to keep the payload
>>> empty for messages that don't actually send any data along? That would
>>> make the handling for such messages easier to do, too. In other words,
>>> make the extended request message have a magic, flags, type, handle,
>>> payload length, offset, and "affected length" field, and leave payload
>>> for actual data.
>>>
>>
>> But why not to keep it more portable? What is a benefit?
> 
> The benefit is that you can read the whole command in one go, without
> having to process the payload length and do a second read.

Reasonable

> 
>> I see the drawback:
>> if we define it with offset/length, than, when we'll want to implement a new
>> command without them, it will be incompatible extension..
> 
> No, we can just ignore the values there.

So, offset will always be 0 for RESIZE?

> 
>>> If somehow we do end up with a message that does not need the offset or
>>> length fields, we can then always mark those as reserved and make the
>>> server ignore them.
>>
>> We may just invent a name for offset/lenght extended requests, something like
>> "standard extended request", and instead of
>>
>>>>> +    `***` supports extended requests, with the following
>>>>> +    16-bytes payload:
>>>>> +
>>>>> +    64 bits: offset
>>>>> +    64 bits: length
>>
>> several times we'll have just
>>
>>>>> +    `***` supports standarad extended requests
>>
>> And we'll need additional paragraph, defining standard extended request, including
>> its layout (64 bits offset and 64 bits length).
> 
> That still requires the second read.
> 
>> Or what you mean by "reserved"? Just treat commands with no offset/length as unknown
>> commands? But this adds nothing to the spec actually.
>>
>> So, do you mean, document that all extended commands have offset and length, but note
>> that "in future, new commands may be added without these fields" ?
> 
> No, I just mean that if we do end up defining a command that doesn't
> require either of those two fields, we can just add to the spec that
> "the length and offset fields are reserved, and should be set to zero
> for this command".
> 

OK, understand. Reasonable thing, agreed. I'll resend.

-- 
Best regards,
Vladimir

