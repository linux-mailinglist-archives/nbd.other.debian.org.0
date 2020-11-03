Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F922A3CED
	for <lists+nbd@lfdr.de>; Tue,  3 Nov 2020 07:41:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1CF17206A2; Tue,  3 Nov 2020 06:41:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov  3 06:41:25 2020
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 418D720695
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Nov 2020 06:41:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.336 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.257,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aMF0g8eEVCEJ for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Nov 2020 06:41:12 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by bendel.debian.org (Postfix) with ESMTP id 7ADC420690
	for <nbd@other.debian.org>; Tue,  3 Nov 2020 06:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604385667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rCgOAmIEwwxNiMQYP8licbx1w3lpFdHbIofaAArF61o=;
	b=Wx8fu5x1ZBhXyMTTyLaekF9t+zxRy6Ixkw5/DFrFmE+Fk9DZFEeEG1jwURGBJtUFwrWGls
	XImGU+cL3P0DTiO8ltq6EHg6edFTGxQYrtRoB0kixvEBdMiz3NM+02xupRzBDlIyH/YMTM
	f96xJpCe/L84Q053QmIHzplLBtg5gOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-th1ggjHlOoqNw-w5rb49Xg-1; Tue, 03 Nov 2020 01:41:05 -0500
X-MC-Unique: th1ggjHlOoqNw-w5rb49Xg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B537B879518;
	Tue,  3 Nov 2020 06:41:03 +0000 (UTC)
Received: from [10.72.13.163] (ovpn-13-163.pek2.redhat.com [10.72.13.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 287715C230;
	Tue,  3 Nov 2020 06:40:57 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] nbd: fix use-after-freed crash for nbd->recv_workq
To: Ming Lei <ming.lei@redhat.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, nbd@other.debian.org,
 linux-block@vger.kernel.org, jdillama@redhat.com, mgolub@suse.de
References: <20201103030758.317781-1-xiubli@redhat.com>
 <20201103030758.317781-2-xiubli@redhat.com> <20201103041215.GD25186@T590>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <49097b1d-53fe-aaba-9b9a-73010496edc5@redhat.com>
Date: Tue, 3 Nov 2020 14:40:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201103041215.GD25186@T590>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mHAjG1FOBuP.A.6XD.VuPofB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1031
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/49097b1d-53fe-aaba-9b9a-73010496edc5@redhat.com
Resent-Date: Tue,  3 Nov 2020 06:41:25 +0000 (UTC)

On 2020/11/3 12:12, Ming Lei wrote:
> On Mon, Nov 02, 2020 at 10:07:57PM -0500, xiubli@redhat.com wrote:
>> From: Xiubo Li <xiubli@redhat.com>
>>
>> The crash call trace:
>>
>> <6>[ 1012.319386] block nbd1: NBD_DISCONNECT
>> <1>[ 1012.319437] BUG: kernel NULL pointer dereference, address: 0000000000000020
>> <1>[ 1012.319439] #PF: supervisor write access in kernel mode
>> <1>[ 1012.319441] #PF: error_code(0x0002) - not-present page
>> <6>[ 1012.319442] PGD 0 P4D 0
>> <4>[ 1012.319448] Oops: 0002 [#1] SMP NOPTI
>> <4>[ 1012.319454] CPU: 9 PID: 25111 Comm: rbd-nbd Tainted: G            E     5.9.0+ #6
>>     [...]
>> <4>[ 1012.319505] PKRU: 55555554
>> <4>[ 1012.319506] Call Trace:
>> <4>[ 1012.319560]  flush_workqueue+0x81/0x440
>> <4>[ 1012.319598]  nbd_disconnect_and_put+0x50/0x70 [nbd]
>> <4>[ 1012.319607]  nbd_genl_disconnect+0xc7/0x170 [nbd]
>> <4>[ 1012.319627]  genl_rcv_msg+0x1dd/0x2f9
>> <4>[ 1012.319642]  ? genl_start+0x140/0x140
>> <4>[ 1012.319644]  netlink_rcv_skb+0x49/0x110
>> <4>[ 1012.319649]  genl_rcv+0x24/0x40
>> <4>[ 1012.319651]  netlink_unicast+0x1a5/0x280
>> <4>[ 1012.319653]  netlink_sendmsg+0x23d/0x470
>> <4>[ 1012.319667]  sock_sendmsg+0x5b/0x60
>> <4>[ 1012.319676]  ____sys_sendmsg+0x1ef/0x260
>> <4>[ 1012.319679]  ? copy_msghdr_from_user+0x5c/0x90
>> <4>[ 1012.319680]  ? ____sys_recvmsg+0xa5/0x180
>> <4>[ 1012.319682]  ___sys_sendmsg+0x7c/0xc0
>> <4>[ 1012.319683]  ? copy_msghdr_from_user+0x5c/0x90
>> <4>[ 1012.319685]  ? ___sys_recvmsg+0x89/0xc0
>> <4>[ 1012.319692]  ? __wake_up_common_lock+0x87/0xc0
>> <4>[ 1012.319715]  ? __check_object_size+0x46/0x173
>> <4>[ 1012.319727]  ? _copy_to_user+0x22/0x30
>> <4>[ 1012.319729]  ? move_addr_to_user+0xc3/0x100
>> <4>[ 1012.319731]  __sys_sendmsg+0x57/0xa0
>> <4>[ 1012.319744]  do_syscall_64+0x33/0x40
>> <4>[ 1012.319760]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> <4>[ 1012.319780] RIP: 0033:0x7f5baa8e3ad5
>>
>> In case the reference of nbd->config has reached zero and the
>> related resource has been released, if another process tries to
>> send the DISCONENCT cmd by using the netlink, it will potentially
>> crash like this.
>>
>> Signed-off-by: Xiubo Li <xiubli@redhat.com>
>> ---
>>   drivers/block/nbd.c | 25 ++++++++++++++++++++-----
>>   1 file changed, 20 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index f46e26c9d9b3..3bb8281bb753 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -2003,16 +2003,31 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
>>   
>>   static void nbd_disconnect_and_put(struct nbd_device *nbd)
>>   {
>> +	bool flush = true;
>> +
>>   	mutex_lock(&nbd->config_lock);
>>   	nbd_disconnect(nbd);
>>   	nbd_clear_sock(nbd);
>> -	mutex_unlock(&nbd->config_lock);
>>   	/*
>> -	 * Make sure recv thread has finished, so it does not drop the last
>> -	 * config ref and try to destroy the workqueue from inside the work
>> -	 * queue.
>> +	 * In very rare case that the nbd->recv_workq may already have been
>> +	 * released by the recv_work().
>>   	 */
>> -	flush_workqueue(nbd->recv_workq);
>> +	if (likely(!nbd->recv_workq))
> It is actually unlikely, but doesn't make any sense to annotate the check
> since it isn't fast path, so please remove it.

Sure, will do it.

Thanks.


>
>> +		refcount_inc(&nbd->config_refs);
>> +	else
>> +		flush = false;
>> +	mutex_unlock(&nbd->config_lock);
>> +
>> +	if (flush) {
>> +		/*
>> +		 * Make sure recv thread has finished, so it does not drop
>> +		 * the last config ref and try to destroy the workqueue
>> +		 * from inside the work queue.
>> +		 */
>> +		flush_workqueue(nbd->recv_workq);
>> +		nbd_config_put(nbd);
>> +	}
>> +
>>   	if (test_and_clear_bit(NBD_RT_HAS_CONFIG_REF,
>>   			       &nbd->config->runtime_flags))
>>   		nbd_config_put(nbd);
> The approach is fine, and the reason is that nbd_disconnect_and_put() still
> can be called via netlink when the nbd device has been closed:
>
> Once the above likely() is removed, feel free to add:
>
> Reviewed-by: Ming Lei <ming.lei@redhat.com>
>
>
> Thanks,
> Ming
>

