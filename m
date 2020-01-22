Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EF043144956
	for <lists+nbd@lfdr.de>; Wed, 22 Jan 2020 02:30:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A2541202C0; Wed, 22 Jan 2020 01:30:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan 22 01:30:09 2020
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 36B56204D1
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Jan 2020 01:13:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wc8K0y6kUVYE for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Jan 2020 01:13:07 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 381 seconds by postgrey-1.36 at bendel; Wed, 22 Jan 2020 01:13:07 UTC
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id 47C46203B9
	for <nbd@other.debian.org>; Wed, 22 Jan 2020 01:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579655582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=viOBq0Oy9N+6NbeXzcqoYU7boYVlTm9ZppUHXuFh0Mo=;
	b=TqdDPZBjby6Tm7NhhLMRHBXUeM2hvTyM66IXMvOc3Sf/PJc6CwfYTyQXVo5UgiMU9q8KMP
	u0wqqCzLfsZ9eEifiPa/Yi084SyW8wNsd9cDBO5Up8LhyDNI0zhJIbp7xgeIt72tIsPFuW
	iLc9HfFRc63rJsa9RG1EQNLl5p1skRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-zW94sMSePQK3sgoIck_AWw-1; Tue, 21 Jan 2020 20:06:37 -0500
X-MC-Unique: zW94sMSePQK3sgoIck_AWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3676C107ACC4;
	Wed, 22 Jan 2020 01:06:36 +0000 (UTC)
Received: from [10.10.120.159] (ovpn-120-159.rdu2.redhat.com [10.10.120.159])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CEA360BE0;
	Wed, 22 Jan 2020 01:06:34 +0000 (UTC)
Subject: Re: [v2] nbd: fix potential NULL pointer fault in nbd_genl_disconnect
To: Josef Bacik <josef@toxicpanda.com>, Sun Ke <sunke32@huawei.com>,
 axboe@kernel.dk
References: <20200120124549.27648-1-sunke32@huawei.com>
 <8bb961fe-3412-9c3c-ad9b-54d446e90bf0@toxicpanda.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
From: Mike Christie <mchristi@redhat.com>
Message-ID: <5E27A01A.3040600@redhat.com>
Date: Tue, 21 Jan 2020 19:06:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <8bb961fe-3412-9c3c-ad9b-54d446e90bf0@toxicpanda.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nIeNS5OpEnM.A.-lD.hW6JeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/780
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5E27A01A.3040600@redhat.com
Resent-Date: Wed, 22 Jan 2020 01:30:09 +0000 (UTC)

On 01/21/2020 08:09 AM, Josef Bacik wrote:
> On 1/20/20 7:45 AM, Sun Ke wrote:
>> Open /dev/nbdX first, the config_refs will be 1 and
>> the pointers in nbd_device are still null. Disconnect
>> /dev/nbdX, then reference a null recv_workq. The
>> protection by config_refs in nbd_genl_disconnect is useless.
>>
>> To fix it, just add a check for a non null task_recv in
>> nbd_genl_disconnect.
>>
>> Signed-off-by: Sun Ke <sunke32@huawei.com>
>> ---
>> v1 -> v2:
>>
>> add an omitted mutex_unlock.
>> ---
>>   drivers/block/nbd.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index b4607dd96185..668bc9cb92ed 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -2008,6 +2008,10 @@ static int nbd_genl_disconnect(struct sk_buff
>> *skb, struct genl_info *info)
>>                  index);
>>           return -EINVAL;
>>       }
>> +    if (!nbd->task_recv) {
>> +        mutex_unlock(&nbd_index_mutex);
>> +        return -EINVAL;
>> +    }
>>       if (!refcount_inc_not_zero(&nbd->refs)) {
>>           mutex_unlock(&nbd_index_mutex);
>>           printk(KERN_ERR "nbd: device at index %d is going down\n",
>>
> 
> This doesn't even really protect us, we need to have the
> nbd->config_lock held here to make sure it's ok.  The IOCTL path is safe
> because it creates the device on open so it's sure to exist by the time
> we get to the disconnect, we don't have that for genl_disconnect.  So
> I'd add the config_mutex before getting the config_ref, and then do the
> check, something like
> 
> mutex_lock(&nbd->config_lock);
> if (!refcount_inc_not_zero(&nbd->refs)) {
> }
> if (!nbd->recv_workq) {
> }
> mutex_unlock(&nbd->config_lock);
> 

We will be doing a mix of checks/behavior. Maybe we want to settle on one?

It seems the code, before my patch, would let you do a open() then do a
nbd_genl_disconnect. This function would then try to cleanup what it
could and return success.

To keep the current behavior/style in nbd_disconnect_and_put would you
want to do:

nbd_disconnect_and_put()

....

if (nbd->task_recv)
       flush_workqueue(nbd->recv_workq);

?

Alternatively, I think if we want to make it so calling
nbd_genl_disconnect is not allowed on a device that we have not done a
successful nbd_genl_connect/nbd_start_device call on then we want to add
the new state bit to indicate nbd_start_device was successful.

Or, we could stick to one variable that gets set at start and always use
that to indicate nbd_start_device was called ok. For example, for
nbd_genl_reconfigure we already check if task_recv is set to check if
nbd_start_device was called successfully.


