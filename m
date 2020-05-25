Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF501E1728
	for <lists+nbd@lfdr.de>; Mon, 25 May 2020 23:28:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8671E2039A; Mon, 25 May 2020 21:28:01 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 25 21:28:01 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=MSGID_FROM_MTA_HEADER,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E836D2039D
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 May 2020 21:12:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.82 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=3,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Oj3SsjvUTqN4 for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 May 2020 21:12:47 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .virtuozzo. - helo: .eur04-vi1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
X-Greylist: delayed 21576 seconds by postgrey-1.36 at bendel; Mon, 25 May 2020 21:12:47 UTC
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0701.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7C9AF20397
	for <nbd@other.debian.org>; Mon, 25 May 2020 21:12:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLwqFvJ/Dk62z7+tDc5kMV7DazY+0q21aUn3vwwrqft91Yk/eixuFGLeDeU+UEokkVS0H9Ycf2m/fVOrr8TYTW9ngRFD1DvDJiqVL6a/G8CbWqMIqCyckOYK0Z8gQsF75iqMt42wIwHlhQ1aZe+xPxWr1xUKWsmGB+Si4zn/s8ObZBEM3yI32UI6qvEbMM51Mt027dY/9GHvUSaBw2d+LfVVk44YFeGYikk6GWP9kjdceW1JoDKE+F1vAAhB1e6mc89r8JYKJkuGTRWuu/OZZp+Scc+dZlqmEyl8sHTU0ywSDY9TEln4/MpcdiWd7ZHsENbcm+FjslzKVmRTkfQxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kD+aSEuTdwYlVD8hhiCLz6dJJAQe00VBZ7OJgQWKTM8=;
 b=cW6Nixin60pI49DRb7NYhTLBlXDXHXqLBAPP/Phwn8i+QYIX0uyZoeWlSu6hcqxC3BOguMpfqUIgzJ/408Ud3/soZYFzCUBTwIJAKbEWAgAisacE7Umz1yXm8bRntEuXLAq9mJrDpEjrWLgmojZSBgv/87w+zSq1aYXVJzHANIaC2EKhu+tzug9+sn8nBkFYiXRdKvoSURXFio2HTDR9AmJyLaQLWaXTz7SDIimtMTbkN5Juc0R8wTQmTbAIak4tXNgL51mLEbWOo3aiDe1eWYuSM+hxi1J9pUnT9sn3t0pfk1ui7XZCqBeG5yNBKqsQk7Lf9YMiIoNeb5CPwfWy2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
Old-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kD+aSEuTdwYlVD8hhiCLz6dJJAQe00VBZ7OJgQWKTM8=;
 b=UhVE2phl1cXSu2KFFCpnm6vlUa6SkmYR091FmnviabmZ39YAOKA5Xdl1y0eaILE50Ipd4nGF9KFHNCu9JTj9mq6naPpk+CWpf8TEmYJ8G6h3FBagUeRo3UR2a5kjdFM0A+3IDZF8x9WW4Tihqtx8twl95NOltShUT/WCuOcjZ9Q=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Mon, 25 May
 2020 14:40:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312%3]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 14:40:18 +0000
Subject: Re: [RFC v2] nbd/proto: introduce extended request and 64bit commands
To: Wouter Verhelst <wouter@grep.be>, Eric Blake <eblake@redhat.com>
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
 <20200525133732.GC3459@grep.be>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <46382987-ac95-fd9b-33f0-51c9a36eba8b@virtuozzo.com>
Date: Mon, 25 May 2020 17:40:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200525133732.GC3459@grep.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR07CA0003.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.2] (185.215.60.147) by AM0PR07CA0003.eurprd07.prod.outlook.com (2603:10a6:208:ac::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.9 via Frontend Transport; Mon, 25 May 2020 14:40:17 +0000
X-Originating-IP: [185.215.60.147]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f1df5bb-ba3b-4606-a394-08d800b98b85
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB533316FE34EC012CB0DBD19EC1B30@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-Forefront-PRVS: 0414DF926F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mZ6uVc2W/RPfp4I5uBIf4bLn6OaZUgkSpnn/CTu1AljuoTA/wNttqGtmHvuPV/z+0nBnoMpqDOU48LTJcokRIycayZo4LpLlN8/KX78w2g5s74cu+8FkpkBRYflsemXCgRDQw/28w4LDodOnu0rGfPy6J3xhTDqX1zN8D14nWjWwT1wEGM0pq94mtnFQ5e4CCtLLpXFzmjWQIs5IAUGmZWu5DPpfcey5hcobaZCKkr3d42ufOjLO5dMaqcW5wLkJUNd7GyCz7EHarVnCLtwO571dVMoG5ctbx94e6q12N6nBqG7E/AStNEJC6FiSl5YHuC91GFjBQJkrWaBrrRyQ0XhT7DAU+xlWeFD0cm+Rs/mhfjZzhuvSymNBDVSzOjRh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5494.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(39840400004)(396003)(346002)(136003)(4326008)(110136005)(316002)(31686004)(5660300002)(956004)(2616005)(6486002)(8676002)(16576012)(31696002)(8936002)(2906002)(86362001)(478600001)(36756003)(186003)(26005)(16526019)(66946007)(107886003)(53546011)(66476007)(66556008)(52116002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData:
	WICgsdTAmXRGAw2/gulybCnDYEwabldrANUVdYRrY1OSFLGe7kpOJXJyZslP38TPxZe8h13saBuAj2YhBSljKAtjS/rLLjtWYFWwb7GS4ieIRYL2tbvMr1TmyYwG9Az89GUwbD8JSq4N0JMPyBrVqvHIELZv4KQ35JpRIwYidN+GznuHDtemFHrnqevrM/wS5F/u4Y4n0S2k9lPzkwtsoJSas0nx0/W1daP/0Sihct3vheGyLJebukFJaP5FwtgQfncG7tZQxFzdCXZY4FWLp8NQwGA3wmgXCzkLusJj0WJlMG5vG/uxmUYWP0jrrRwAVNpNUxOFkLkGe8f4hJszAurAcpCpjy+psCW/bSep2OC9TZEwVPMjWMeyU04Z3wwKIivtIESlwqECPqUBah5gPszRVKb18jQv4CnGtk9XBpJB3EjoUT7TD3LZLE+iJuWAodEdeCizrd4fB8aBHNNwmTyY35CDXscaceTibgbwc4tl4OWhpCF5vLL7UfUD2UfA
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1df5bb-ba3b-4606-a394-08d800b98b85
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2020 14:40:18.3701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3WBTtbGuCRZggsQi7rHI1ERjG/GnLTLa5scDEArMvIPr11CuZu2DvKoKiySXksZh5x+JIIOdPzU8455fVWR+2R0g/CCAN19aGhLW3/SPVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0VV-_wfTynD.A.NCH.hhDzeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/880
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/46382987-ac95-fd9b-33f0-51c9a36eba8b@virtuozzo.com
Resent-Date: Mon, 25 May 2020 21:28:01 +0000 (UTC)

25.05.2020 16:37, Wouter Verhelst wrote:
> Hi guys,
> 
> Sorry for slacking here.
> 
> On Wed, Mar 18, 2020 at 07:22:39AM -0500, Eric Blake wrote:
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
>> Not much of one.  You're micro-optimizing the read()s, but in reality, the
>> sender will likely send() the entire packet at once, at which point the data
>> is in the kernel and the reads will succeed back-to-back, or you can even
>> write the client to read into a buffer to minimize syscalls and then parse
>> as much as needed out of the buffer.
>>
>> You've got a LOT more overhead in the TCP packet and network transmission
>> time than you do in deciding whether the server has to do 2 or 3 read()s per
>> client message.
>>
>> While it might be nice to design a message that doesn't need the server to
>> do additional decision points mid-packet in determining how much packet
>> remains, that should not be your driving factor. Even with current servers,
>> that is already the case (the server has to decide mid-packet whether it is
>> handling NBD_CMD_WRITE and thus has more data to read).
> 
> Having payload length and affected length as separate entities also
> makes the protocol context free, which should make things easier to
> parse for things like wireshark etc. It also feels a bit cleaner to me,
> in that a server implementation can separate "reading data" from
> "handling data" more cleanly.
> 
> (e.g., nbd-server has to special-case NBD_CMD_WRITE in a generic "read
> the next command" function, which I think is rather ugly)
> 
> Other than this (minor) issue, I think this proposal is certainly ready
> to go, and I apologise for not having followed up on it ealier.
> 
> Would you be so kind as to propose a new patch, with changes as
> suggested in this thread? I promise to not let it linger for months
> again then ;-)
> 

Hi!) Which changes do you mean?

In my last two emails I argue for no-changes and nobody answered.. Are you OK with patch as is or what do you want to change?

-- 
Best regards,
Vladimir

