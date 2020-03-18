Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAEA1895ED
	for <lists+nbd@lfdr.de>; Wed, 18 Mar 2020 07:36:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8A40E205CC; Wed, 18 Mar 2020 06:36:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 18 06:36:09 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MSGID_FROM_MTA_HEADER,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E47242058C
	for <lists-other-nbd@bendel.debian.org>; Wed, 18 Mar 2020 06:19:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MSGID_FROM_MTA_HEADER=3, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id L7oQolOcezUg for <lists-other-nbd@bendel.debian.org>;
	Wed, 18 Mar 2020 06:19:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .virtuozzo. - helo: .eur04-vi1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80102.outbound.protection.outlook.com [40.107.8.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 53A0720579
	for <nbd@other.debian.org>; Wed, 18 Mar 2020 06:19:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7gmj+7rqQl6SodbnXiA/08CjBeNwAvYOvMPP5NIvTu1ot2eZm7ekyo7SMia83PPStu3c2q7RL05mqO0RrRhzWqNQ4e5DeDXVZHuw47DginfUArEejlCeZPpWt3+I3sShXNHgbVDqE6+VEpEllzfQnW0xCELjByc7UcSHRavFeyPiFnP5Lnr0UjHUDp4apcKfMGg3xn0MrGVM0VdJbtvv7XUc8HbCTO7kFtgD4SgtMx3YwF0mHmUIFy4V5t//936p6JMazKEs9gflLBmH0XHyLfIa1zfOq+GiDkPdP1XU5r9cGA4WioC2cBp4eLokIRR3o6w9wUm/U6WDbH3DkHkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfN175LxbjiOKqdf3XxZ3ntKheot1MNfeDdixzRBjAk=;
 b=RwWZODIaGhLBwWuxHJQlfyQH3Zt+5nIk6F+z8D9LCoA1Eyn+pzQ74kpVXVcYUcDWHsT14buSzMLOUn3dtw4c/k1DRmVK+na124h8Vr4V9ZjswnAZZhmFi/Iq7pHgyWc4YnezYRLlPNns4o4mJst3mvfSYmmP7/3O7Q3+kkixNv7x8KWu9zkK4bGSl5cCMQOCSxRW34/AX/E9JzvtWiSoS+H595Nj0RoaoCxH0VS1j09ABBCHYPc7IZUwSEIDSJUkIExsN24bOUuiAKflw08KUGJH5S1rJmBzqTMZUXfP5IMUg47ycny0x6wq/XhzCSkJO7OCKnaroFL8VqjFIEw12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfN175LxbjiOKqdf3XxZ3ntKheot1MNfeDdixzRBjAk=;
 b=I9X5E8yCYOIMl4uVSq+tfOLMR5eWkJD49JEtR6ZVN/NU1ENvRVpK+GLJ+0ZFpliKxyd1hf9wBf6C0RBAm3/6sJjmMLSbTGPeTwm4ghGFlgXpzA7DA11gAHOhTNpvQwdWT9YeynXBb9zMSu7xABeoAb2zSlEqlDE/nQfggY/+mrY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com (10.175.35.136) by
 HE1PR0802MB2364.eurprd08.prod.outlook.com (10.172.128.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.21; Wed, 18 Mar 2020 06:19:48 +0000
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f]) by HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f%12]) with mapi id 15.20.2835.017; Wed, 18 Mar
 2020 06:19:48 +0000
Subject: Re: [RFC v2] nbd/proto: introduce extended request and 64bit commands
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Wouter Verhelst <wouter@grep.be>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, eblake@redhat.com,
 w@uter.be, nsoffer@redhat.com, den@openvz.org
References: <20200206151547.5812-1-vsementsov@virtuozzo.com>
 <2f56c11f-3380-9b83-6873-2ec8f4c3d07d@virtuozzo.com>
 <20200317161859.GD27056@grep.be>
 <fd6a5d69-36da-bb4f-b67d-44ef80577a88@virtuozzo.com>
 <20200318053337.GE27056@grep.be>
 <49e18291-7e7b-a363-c807-80d4cc589fd8@virtuozzo.com>
X-Tagtoolbar-Keys: D20200318091945038
Message-ID: <78efe37b-b54b-cc59-aec2-1ce39ec1676b@virtuozzo.com>
Date: Wed, 18 Mar 2020 09:19:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <49e18291-7e7b-a363-c807-80d4cc589fd8@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0046.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::15) To HE1PR0802MB2507.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.2] (185.215.60.249) by ZR0P278CA0046.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend Transport; Wed, 18 Mar 2020 06:19:46 +0000
X-Tagtoolbar-Keys: D20200318091945038
X-Originating-IP: [185.215.60.249]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d226e96-f991-4002-8c89-08d7cb045bd5
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2364:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2364B41935BF2728D7B710FBC1F70@HE1PR0802MB2364.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report:
	SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(366004)(136003)(199004)(2616005)(956004)(4326008)(6486002)(26005)(5660300002)(2906002)(16526019)(186003)(107886003)(36756003)(81166006)(66476007)(8936002)(6916009)(66946007)(66556008)(81156014)(52116002)(8676002)(31686004)(16576012)(31696002)(86362001)(508600001);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR0802MB2364;H:HE1PR0802MB2507.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xCemcXDPOsz2PfqdVe2YeYudHPvTm3jYwLNfsGME6JgsUi9lj3h5XCM+1YP+JSsdwNfWTP+cYW7KyDaumKkowlyE5gfQho6JOTlOb5xOqsk9n+AzqKmQriKYhaul1s7oAbCjXgZMRzcaVBsW1bzWU8Aa1BjXf4VFUG4alLhh2ZJCIgW5DhpCTnzP+EnZNVS0xlrTCOnCtJSjzzTfh2qmjRCTRVL8wcTCSHegu+15sGxCZ+HGyjBOE3Smw/g1b1XjfaMo6abGmhPutw3X2KxoVXfbJZieAup3nLs5G6O+wUB99u+gdfwpm2MlaokKzlWzpxbeZ/X5AGo0eVLPtoNqNgQTgQ5Y7IL0djD5bTggdcqwxETy6eneqtirPhlERb9U6WcETmOqop3MhdihCh9/Gt9+Yf8zyCnldne8dGJZ1DyLkC0qf71oH08S2wA1gArY
X-MS-Exchange-AntiSpam-MessageData:
	xZsQxx1ZpgdonZA+CSR6gi7wz8+1XgEtit0mJTb/MdQONpFyvzincF9XnDmmzzj5Z0Z0FJPU/wXOuI/Ji9HKnSqbap9wJ+An6LColwTSkGUlM/VDa4ZRK3mh29lKhddWY1buikxdBJqOIuK2wnwBfQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d226e96-f991-4002-8c89-08d7cb045bd5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 06:19:47.9682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTR4wH027BR134eQnSIfz5TRk50pwYd5Ex3RmHKdknrMQkF+CBpNBWHbvEjlLmWcNy4Imjbp2k7/rNr9KlFsek1y5OnMas9htjSC9ZM5oo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2364
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vBdtS0W-HpO.A.UPD.ZFcceB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/862
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/78efe37b-b54b-cc59-aec2-1ce39ec1676b@virtuozzo.com
Resent-Date: Wed, 18 Mar 2020 06:36:09 +0000 (UTC)

18.03.2020 8:49, Vladimir Sementsov-Ogievskiy wrote:
> 18.03.2020 8:33, Wouter Verhelst wrote:
>> On Tue, Mar 17, 2020 at 09:10:32PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> 17.03.2020 19:18, Wouter Verhelst wrote:
>>>> Hi Vladimir,
>>>>
>>>> Sorry for the delay; I got married late last month (yay!), so obviously
>>>> I was a little preoccupied ;-)
>>>
>>> Congratulations!! Be happy!
>>>
>>>>
>>>> On Fri, Feb 28, 2020 at 01:22:43PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>>> ping
>>>>>
>>>>> 06.02.2020 18:15, Vladimir Sementsov-Ogievskiy wrote:
>>>> [...]
>>>>>> +The extended request message, sent by the client, looks as follows:
>>>>>> +
>>>>>> +C: 32 bits, 0x23876289, magic (`NBD_EXTENDED_REQUEST_MAGIC`)
>>>>>> +C: 16 bits, flags
>>>>>> +C: 16 bits, type
>>>>>> +C: 64 bits, handle
>>>>>> +C: 32 bits, length of payload (unsigned)
>>>>>> +C: *length* bytes of payload data (if *length* is nonzero)
>>>> [...]
>>>>>>         A client MUST NOT send a trim request unless `NBD_FLAG_SEND_TRIM`
>>>>>>         was set in the transmission flags field.
>>>>>> +    `NBD_CMD_TRIM` supports extended requests, with the following
>>>>>> +    16-bytes payload:
>>>>>> +
>>>>>> +    64 bits: offset
>>>>>> +    64 bits: length
>>>>>> +
>>>>>>     * `NBD_CMD_CACHE` (5)
>>>>>>         A cache request.  The client is informing the server that it plans
>>>>>> @@ -2095,6 +2127,12 @@ The following request types exist:
>>>>>>         including one or more sectors beyond the size of the device. It SHOULD
>>>>>>         return `NBD_EPERM` if it receives a write zeroes request on a read-only export.
>>>>>> +    `NBD_CMD_WRITE_ZEROES` supports extended requests, with the following
>>>>>> +    16-bytes payload:
>>>>>> +
>>>>>> +    64 bits: offset
>>>>>> +    64 bits: length
>>>>>> +
>>>>>>     * `NBD_CMD_BLOCK_STATUS` (7)
>>>>>>         A block status query request. Length and offset define the range
>>>>>> @@ -2154,6 +2192,12 @@ The following request types exist:
>>>>>>         `NBD_EINVAL` if it receives a `NBD_CMD_BLOCK_STATUS` request including
>>>>>>         one or more sectors beyond the size of the device.
>>>>>> +    `NBD_CMD_BLOCK_STATUS` supports extended requests, with the following
>>>>>> +    16-bytes payload:
>>>>>> +
>>>>>> +    64 bits: offset
>>>>>> +    64 bits: length
>>>>
>>>> I can't actually think of any command that would not require offset and
>>>> length fields; and given my quote, it would appear neither can you.
>>>
>>> Hmm. What about RESIZE? May be, some kind of REOPEN..
>>
>> RESIZE would need a length. It would probably not need an offset, that
>> is true.
>>
>> A REOPEN command could use both if we wanted to support a partial
>> reopen.
>>
>>>> Given that, wouldn't it make more sense to have the offset and length
>>>> fields be part of the extended request message, and to keep the payload
>>>> empty for messages that don't actually send any data along? That would
>>>> make the handling for such messages easier to do, too. In other words,
>>>> make the extended request message have a magic, flags, type, handle,
>>>> payload length, offset, and "affected length" field, and leave payload
>>>> for actual data.
>>>>
>>>
>>> But why not to keep it more portable? What is a benefit?
>>
>> The benefit is that you can read the whole command in one go, without
>> having to process the payload length and do a second read.
> 
> Reasonable
> 
>>
>>> I see the drawback:
>>> if we define it with offset/length, than, when we'll want to implement a new
>>> command without them, it will be incompatible extension..
>>
>> No, we can just ignore the values there.
> 
> So, offset will always be 0 for RESIZE?
> 
>>
>>>> If somehow we do end up with a message that does not need the offset or
>>>> length fields, we can then always mark those as reserved and make the
>>>> server ignore them.
>>>
>>> We may just invent a name for offset/lenght extended requests, something like
>>> "standard extended request", and instead of
>>>
>>>>>> +    `***` supports extended requests, with the following
>>>>>> +    16-bytes payload:
>>>>>> +
>>>>>> +    64 bits: offset
>>>>>> +    64 bits: length
>>>
>>> several times we'll have just
>>>
>>>>>> +    `***` supports standarad extended requests
>>>
>>> And we'll need additional paragraph, defining standard extended request, including
>>> its layout (64 bits offset and 64 bits length).
>>
>> That still requires the second read.
>>
>>> Or what you mean by "reserved"? Just treat commands with no offset/length as unknown
>>> commands? But this adds nothing to the spec actually.
>>>
>>> So, do you mean, document that all extended commands have offset and length, but note
>>> that "in future, new commands may be added without these fields" ?
>>
>> No, I just mean that if we do end up defining a command that doesn't
>> require either of those two fields, we can just add to the spec that
>> "the length and offset fields are reserved, and should be set to zero
>> for this command".
>>
> 
> OK, understand. Reasonable thing, agreed. I'll resend.
> 


Hmm. But we can't read in one go anyway, because we need to distinguish NBD_REQUEST_MAGIC
from NBD_EXTENDED_REQUEST_MAGIC..

I think, that modern client will use mostly NBD_EXTENDED_REQUEST_MAGIC interface, so it will
be great to optimize it. But to read extended request in one go, we should make it
shorter than simple request, and it doesn't seem possible.

May be we should not support simple and extended requests together? May be better to force
using only extended requests if they are negotiated? Then we will read extended request in
on go, and we may just define it like

C: 32 bits, 0x23876289, magic (`NBD_EXTENDED_REQUEST_MAGIC`)
C: 16 bits, flags
C: 16 bits, type
C: 64 bits, handle
C: 32 bits, length of payload (unsigned), MUST be greater or equal to 16
C: *length* bytes of payload data (if *length* is nonzero)

- so, we'll just read 36 bytes in one go, and then additional payload, if length
is more than 16.

-- 
Best regards,
Vladimir

