Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3496031E960
	for <lists+nbd@lfdr.de>; Thu, 18 Feb 2021 12:57:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1BD752045F; Thu, 18 Feb 2021 11:57:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 18 11:57:10 2021
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FVGT_m_MULTI_ODD,HTML_FONT_FACE_BAD,HTML_MESSAGE,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6FEBA20474
	for <lists-other-nbd@bendel.debian.org>; Thu, 18 Feb 2021 11:41:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=3.341 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, HTML_FONT_FACE_BAD=3, HTML_MESSAGE=2,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xLSDgfrWRcZr for <lists-other-nbd@bendel.debian.org>;
	Thu, 18 Feb 2021 11:41:00 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga06-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6877320485
	for <nbd@other.debian.org>; Thu, 18 Feb 2021 11:41:00 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DhCRb60YvzjNSc;
	Thu, 18 Feb 2021 19:39:39 +0800 (CST)
Received: from [10.174.178.31] (10.174.178.31) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 18 Feb 2021 19:40:49 +0800
Subject: Re: [PATCH v5 1/2] nbd: Fix NULL pointer in flush_workqueue
To: Josef Bacik <josef@toxicpanda.com>, <axboe@kernel.dk>,
	<Markus.Elfring@web.de>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>
References: <20210205065650.2357457-1-sunke32@huawei.com>
 <20210205065650.2357457-2-sunke32@huawei.com>
 <a38d7926-5989-dfd8-b27b-37a2b92797f0@toxicpanda.com>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <ed227f9e-f032-cb28-029e-40bd5da76ac2@huawei.com>
Date: Thu, 18 Feb 2021 19:40:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <a38d7926-5989-dfd8-b27b-37a2b92797f0@toxicpanda.com>
Content-Type: multipart/alternative;
	boundary="------------32FC06AEF3346B56D8257E5E"
X-Originating-IP: [10.174.178.31]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <S9YAeXWRrPK.A.8KC.WYlLgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1132
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ed227f9e-f032-cb28-029e-40bd5da76ac2@huawei.com
Resent-Date: Thu, 18 Feb 2021 11:57:10 +0000 (UTC)

--------------32FC06AEF3346B56D8257E5E
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


在 2021/2/11 0:25, Josef Bacik 写道:
> On 2/5/21 1:56 AM, Sun Ke wrote:
>> Open /dev/nbdX first, the config_refs will be 1 and
>> the pointers in nbd_device are still null. Disconnect
>> /dev/nbdX, then reference a null recv_workq. The
>> protection by config_refs in nbd_genl_disconnect is useless.
>>
>> [  656.366194] BUG: kernel NULL pointer dereference, address: 
>> 0000000000000020
>> [  656.368943] #PF: supervisor write access in kernel mode
>> [  656.369844] #PF: error_code(0x0002) - not-present page
>> [  656.370717] PGD 10cc87067 P4D 10cc87067 PUD 1074b4067 PMD 0
>> [  656.371693] Oops: 0002 [#1] SMP
>> [  656.372242] CPU: 5 PID: 7977 Comm: nbd-client Not tainted 
>> 5.11.0-rc5-00040-g76c057c84d28 #1
>> [  656.373661] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
>> BIOS 
>> ?-20190727_073836-buildvm-ppc64le-16.ppc.fedoraproject.org-3.fc31 
>> 04/01/2014
>> [  656.375904] RIP: 0010:mutex_lock+0x29/0x60
>> [  656.376627] Code: 00 0f 1f 44 00 00 55 48 89 fd 48 83 05 6f d7 fe 
>> 08 01 e8 7a c3 ff ff 48 83 05 6a d7 fe 08 01 31 c0 65 48 8b 14 25 00 
>> 6d 01 00 <f0> 48 0f b1 55 d
>> [  656.378934] RSP: 0018:ffffc900005eb9b0 EFLAGS: 00010246
>> [  656.379350] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
>> 0000000000000000
>> [  656.379915] RDX: ffff888104cf2600 RSI: ffffffffaae8f452 RDI: 
>> 0000000000000020
>> [  656.380473] RBP: 0000000000000020 R08: 0000000000000000 R09: 
>> ffff88813bd6b318
>> [  656.381039] R10: 00000000000000c7 R11: fefefefefefefeff R12: 
>> ffff888102710b40
>> [  656.381599] R13: ffffc900005eb9e0 R14: ffffffffb2930680 R15: 
>> ffff88810770ef00
>> [  656.382166] FS:  00007fdf117ebb40(0000) GS:ffff88813bd40000(0000) 
>> knlGS:0000000000000000
>> [  656.382806] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  656.383261] CR2: 0000000000000020 CR3: 0000000100c84000 CR4: 
>> 00000000000006e0
>> [  656.383819] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
>> 0000000000000000
>> [  656.384370] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 
>> 0000000000000400
>> [  656.384927] Call Trace:
>> [  656.385111]  flush_workqueue+0x92/0x6c0
>> [  656.385395]  nbd_disconnect_and_put+0x81/0xd0
>> [  656.385716]  nbd_genl_disconnect+0x125/0x2a0
>> [  656.386034]  genl_family_rcv_msg_doit.isra.0+0x102/0x1b0
>> [  656.386422]  genl_rcv_msg+0xfc/0x2b0
>> [  656.386685]  ? nbd_ioctl+0x490/0x490
>> [  656.386954]  ? genl_family_rcv_msg_doit.isra.0+0x1b0/0x1b0
>> [  656.387354]  netlink_rcv_skb+0x62/0x180
>> [  656.387638]  genl_rcv+0x34/0x60
>> [  656.387874]  netlink_unicast+0x26d/0x590
>> [  656.388162]  netlink_sendmsg+0x398/0x6c0
>> [  656.388451]  ? netlink_rcv_skb+0x180/0x180
>> [  656.388750]  ____sys_sendmsg+0x1da/0x320
>> [  656.389038]  ? ____sys_recvmsg+0x130/0x220
>> [  656.389334]  ___sys_sendmsg+0x8e/0xf0
>> [  656.389605]  ? ___sys_recvmsg+0xa2/0xf0
>> [  656.389889]  ? handle_mm_fault+0x1671/0x21d0
>> [  656.390201]  __sys_sendmsg+0x6d/0xe0
>> [  656.390464]  __x64_sys_sendmsg+0x23/0x30
>> [  656.390751]  do_syscall_64+0x45/0x70
>> [  656.391017]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>
>> Fixes: e9e006f5fcf2 ("nbd: fix max number of supported devs")
>> Suggested-by: Markus Elfring <Markus.Elfring@web.de>
>> Signed-off-by: Sun Ke <sunke32@huawei.com>
>> ---
>> v4: Share exception handling code for if branches
>> v3: Do not use unlock and add put_nbd.
>> v2: Use jump target unlock.
>> ---
>>   drivers/block/nbd.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index e6ea5d344f87..3c9b3bf3f4c2 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -2014,17 +2014,20 @@ static int nbd_genl_disconnect(struct sk_buff 
>> *skb, struct genl_info *info)
>>       mutex_lock(&nbd_index_mutex);
>>       nbd = idr_find(&nbd_index_idr, index);
>>       if (!nbd) {
>> -        mutex_unlock(&nbd_index_mutex);
>>           printk(KERN_ERR "nbd: couldn't find device at index %d\n",
>>                  index);
>> -        return -EINVAL;
>> +        goto unlock_index;
>>       }
>> -    if (!refcount_inc_not_zero(&nbd->refs)) {
>> -        mutex_unlock(&nbd_index_mutex);
>> +    mutex_lock(&nbd->config_lock);
>> +    if (!refcount_inc_not_zero(&nbd->refs) || !nbd->recv_workq) {
>
> We can't safely take the ->config_log if we don't have a ref. Just add
>
> if (nbd->recv_workq)
>     flush_workqueue(nbd->recv_workq);
>
> to nbd_disconnect_and_put().  Problem solved, we can't drop it until 
> we drop our last config ref, and we're holding a config ref here.  We 
> could probably add it in the meantime, but at this point we've 
> disconnected all of our sockets so it doesn't matter. Thanks,
>
> Josef
> .

OK, I will send it again.

Thanks,
Sun Ke

--------------32FC06AEF3346B56D8257E5E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2021/2/11 0:25, Josef Bacik 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a38d7926-5989-dfd8-b27b-37a2b92797f0@toxicpanda.com">On
      2/5/21 1:56 AM, Sun Ke wrote:
      <br>
      <blockquote type="cite">Open /dev/nbdX first, the config_refs will
        be 1 and
        <br>
        the pointers in nbd_device are still null. Disconnect
        <br>
        /dev/nbdX, then reference a null recv_workq. The
        <br>
        protection by config_refs in nbd_genl_disconnect is useless.
        <br>
        <br>
        [  656.366194] BUG: kernel NULL pointer dereference, address:
        0000000000000020
        <br>
        [  656.368943] #PF: supervisor write access in kernel mode
        <br>
        [  656.369844] #PF: error_code(0x0002) - not-present page
        <br>
        [  656.370717] PGD 10cc87067 P4D 10cc87067 PUD 1074b4067 PMD 0
        <br>
        [  656.371693] Oops: 0002 [#1] SMP
        <br>
        [  656.372242] CPU: 5 PID: 7977 Comm: nbd-client Not tainted
        5.11.0-rc5-00040-g76c057c84d28 #1
        <br>
        [  656.373661] Hardware name: QEMU Standard PC (i440FX + PIIX,
        1996), BIOS
        ?-20190727_073836-buildvm-ppc64le-16.ppc.fedoraproject.org-3.fc31
        04/01/2014
        <br>
        [  656.375904] RIP: 0010:mutex_lock+0x29/0x60
        <br>
        [  656.376627] Code: 00 0f 1f 44 00 00 55 48 89 fd 48 83 05 6f
        d7 fe 08 01 e8 7a c3 ff ff 48 83 05 6a d7 fe 08 01 31 c0 65 48
        8b 14 25 00 6d 01 00 &lt;f0&gt; 48 0f b1 55 d
        <br>
        [  656.378934] RSP: 0018:ffffc900005eb9b0 EFLAGS: 00010246
        <br>
        [  656.379350] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
        0000000000000000
        <br>
        [  656.379915] RDX: ffff888104cf2600 RSI: ffffffffaae8f452 RDI:
        0000000000000020
        <br>
        [  656.380473] RBP: 0000000000000020 R08: 0000000000000000 R09:
        ffff88813bd6b318
        <br>
        [  656.381039] R10: 00000000000000c7 R11: fefefefefefefeff R12:
        ffff888102710b40
        <br>
        [  656.381599] R13: ffffc900005eb9e0 R14: ffffffffb2930680 R15:
        ffff88810770ef00
        <br>
        [  656.382166] FS:  00007fdf117ebb40(0000)
        GS:ffff88813bd40000(0000) knlGS:0000000000000000
        <br>
        [  656.382806] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
        <br>
        [  656.383261] CR2: 0000000000000020 CR3: 0000000100c84000 CR4:
        00000000000006e0
        <br>
        [  656.383819] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
        0000000000000000
        <br>
        [  656.384370] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
        0000000000000400
        <br>
        [  656.384927] Call Trace:
        <br>
        [  656.385111]  flush_workqueue+0x92/0x6c0
        <br>
        [  656.385395]  nbd_disconnect_and_put+0x81/0xd0
        <br>
        [  656.385716]  nbd_genl_disconnect+0x125/0x2a0
        <br>
        [  656.386034]  genl_family_rcv_msg_doit.isra.0+0x102/0x1b0
        <br>
        [  656.386422]  genl_rcv_msg+0xfc/0x2b0
        <br>
        [  656.386685]  ? nbd_ioctl+0x490/0x490
        <br>
        [  656.386954]  ? genl_family_rcv_msg_doit.isra.0+0x1b0/0x1b0
        <br>
        [  656.387354]  netlink_rcv_skb+0x62/0x180
        <br>
        [  656.387638]  genl_rcv+0x34/0x60
        <br>
        [  656.387874]  netlink_unicast+0x26d/0x590
        <br>
        [  656.388162]  netlink_sendmsg+0x398/0x6c0
        <br>
        [  656.388451]  ? netlink_rcv_skb+0x180/0x180
        <br>
        [  656.388750]  ____sys_sendmsg+0x1da/0x320
        <br>
        [  656.389038]  ? ____sys_recvmsg+0x130/0x220
        <br>
        [  656.389334]  ___sys_sendmsg+0x8e/0xf0
        <br>
        [  656.389605]  ? ___sys_recvmsg+0xa2/0xf0
        <br>
        [  656.389889]  ? handle_mm_fault+0x1671/0x21d0
        <br>
        [  656.390201]  __sys_sendmsg+0x6d/0xe0
        <br>
        [  656.390464]  __x64_sys_sendmsg+0x23/0x30
        <br>
        [  656.390751]  do_syscall_64+0x45/0x70
        <br>
        [  656.391017]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
        <br>
        <br>
        Fixes: e9e006f5fcf2 ("nbd: fix max number of supported devs")
        <br>
        Suggested-by: Markus Elfring <a class="moz-txt-link-rfc2396E" href="mailto:Markus.Elfring@web.de">&lt;Markus.Elfring@web.de&gt;</a>
        <br>
        Signed-off-by: Sun Ke <a class="moz-txt-link-rfc2396E" href="mailto:sunke32@huawei.com">&lt;sunke32@huawei.com&gt;</a>
        <br>
        ---
        <br>
        v4: Share exception handling code for if branches
        <br>
        v3: Do not use unlock and add put_nbd.
        <br>
        v2: Use jump target unlock.
        <br>
        ---
        <br>
          drivers/block/nbd.c | 11 +++++++----
        <br>
          1 file changed, 7 insertions(+), 4 deletions(-)
        <br>
        <br>
        diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
        <br>
        index e6ea5d344f87..3c9b3bf3f4c2 100644
        <br>
        --- a/drivers/block/nbd.c
        <br>
        +++ b/drivers/block/nbd.c
        <br>
        @@ -2014,17 +2014,20 @@ static int nbd_genl_disconnect(struct
        sk_buff *skb, struct genl_info *info)
        <br>
              mutex_lock(&amp;nbd_index_mutex);
        <br>
              nbd = idr_find(&amp;nbd_index_idr, index);
        <br>
              if (!nbd) {
        <br>
        -        mutex_unlock(&amp;nbd_index_mutex);
        <br>
                  printk(KERN_ERR "nbd: couldn't find device at index
        %d\n",
        <br>
                         index);
        <br>
        -        return -EINVAL;
        <br>
        +        goto unlock_index;
        <br>
              }
        <br>
        -    if (!refcount_inc_not_zero(&amp;nbd-&gt;refs)) {
        <br>
        -        mutex_unlock(&amp;nbd_index_mutex);
        <br>
        +    mutex_lock(&amp;nbd-&gt;config_lock);
        <br>
        +    if (!refcount_inc_not_zero(&amp;nbd-&gt;refs) ||
        !nbd-&gt;recv_workq) {
        <br>
      </blockquote>
      <br>
      We can't safely take the -&gt;config_log if we don't have a ref. 
      Just add
      <br>
      <br>
      if (nbd-&gt;recv_workq)
      <br>
          flush_workqueue(nbd-&gt;recv_workq);
      <br>
      <br>
      to nbd_disconnect_and_put().  Problem solved, we can't drop it
      until we drop our last config ref, and we're holding a config ref
      here.  We could probably add it in the meantime, but at this point
      we've disconnected all of our sockets so it doesn't matter. 
      Thanks,
      <br>
      <br>
      Josef
      <br>
      .
      <br>
    </blockquote>
    <p><font face="Bauhaus 93">OK, I will send it again.</font></p>
    <font face="Bauhaus 93">Thanks,</font><br>
    <font face="Bauhaus 93">Sun Ke</font>
  </body>
</html>

--------------32FC06AEF3346B56D8257E5E--

