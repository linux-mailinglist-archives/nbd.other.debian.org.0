Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCEB1571BA
	for <lists+nbd@lfdr.de>; Mon, 10 Feb 2020 10:33:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E4FDB20515; Mon, 10 Feb 2020 09:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 10 09:33:09 2020
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F0C6E20507
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Feb 2020 09:15:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nMUHRpCh5U98 for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Feb 2020 09:15:26 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL_SUBNET=-1.2 (check from: .huawei. - helo: .huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -4.7
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3ABA4204FF
	for <nbd@other.debian.org>; Mon, 10 Feb 2020 09:15:24 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id AEEC67CCB37944FB8949;
	Mon, 10 Feb 2020 17:15:17 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.66) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Mon, 10 Feb 2020
 17:15:12 +0800
Subject: Re: [PATCH] nbd: fix potential NULL pointer fault in connect and
 disconnect process
To: Mike Christie <mchristi@redhat.com>, <josef@toxicpanda.com>,
	<axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, Xiubo Li <xiubli@redhat.com>
References: <20200117115005.37006-1-sunke32@huawei.com>
 <5E21EF96.1010204@redhat.com>
 <c15baa64-ef8d-970f-f4e0-ecd10cc0b0a0@huawei.com>
 <5E40CB1F.7070301@redhat.com>
From: "sunke (E)" <sunke32@huawei.com>
Message-ID: <a35ac207-86e3-51d7-4f21-9fcc6ee63e4e@huawei.com>
Date: Mon, 10 Feb 2020 17:15:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <5E40CB1F.7070301@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.222.66]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <26yX_3KKqCO.A.T3B.VNSQeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/805
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a35ac207-86e3-51d7-4f21-9fcc6ee63e4e@huawei.com
Resent-Date: Mon, 10 Feb 2020 09:33:09 +0000 (UTC)

Hi Mike

Your idea looks good.

Thanks,
Sun Ke

在 2020/2/10 11:16, Mike Christie 写道:
> On 01/19/2020 01:10 AM, sunke (E) wrote:
>>
>> Thanks for your detailed suggestions.
>>
>> 在 2020/1/18 1:32, Mike Christie 写道:
>>> On 01/17/2020 05:50 AM, Sun Ke wrote:
>>>> Connect and disconnect a nbd device repeatedly, will cause
>>>> NULL pointer fault.
>>>>
>>>> It will appear by the steps:
>>>> 1. Connect the nbd device and disconnect it, but now nbd device
>>>>      is not disconnected totally.
>>>> 2. Connect the same nbd device again immediately, it will fail
>>>>      in nbd_start_device with a EBUSY return value.
>>>> 3. Wait a second to make sure the last config_refs is reduced
>>>>      and run nbd_config_put to disconnect the nbd device totally.
>>>> 4. Start another process to open the nbd_device, config_refs
>>>>      will increase and at the same time disconnect it.
>>>
>>> Just to make sure I understood this, for step 4 the process is doing:
>>>
>>> open(/dev/nbdX);
>>> ioctl(NBD_DISCONNECT, /dev/nbdX) or nbd_genl_disconnect(for /dev/nbdX)
>>>
>>> ?
>>>
>> do nbd_genl_disconnect(for /dev/nbdX)；
>> I tested it. Connect /dev/nbdX
>> through ioctl interface by nbd-client -L -N export localhost /dev/nbdX and
>> through netlink interface by nbd-client localhost XXXX /dev/nbdX,
>> disconnect /dev/nbdX by nbd-client -d /dev/nbdX.
>> Both call nbd_genl_disconnect(for /dev/nbdX) and both contain the same
>> null pointer dereference.
>>> There is no successful NBD_DO_IT / nbd_genl_connect between the open and
>>> disconnect calls at step #4, because it would normally be done at #2 and
>>> that failed. nbd_disconnect_and_put could then reference a null
>>> recv_workq. If we are also racing with a close() then that could free
>>> the device/config from under nbd_disconnect_and_put.
>>>
>> Yes, nbd_disconnect_and_put could then reference a null recv_workq.
> 
> Hey Sunke
> 
> How about the attached patch. I am still testing it. The basic idea is
> that we need to do a flush whenever we have done a sock_shutdown and are
> in the disconnect/connect/clear sock path, so it just adds the flush in
> that function. We then do not need to keep adding these flushes everywhere.
> 

