Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B76837A0EC
	for <lists+nbd@lfdr.de>; Tue, 11 May 2021 09:36:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1F016202D3; Tue, 11 May 2021 07:36:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 11 07:36:10 2021
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=FOURLA,HTML_MESSAGE,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 730E9202A1
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 May 2021 07:19:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, HTML_MESSAGE=2,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id K_N-JbvUfqsP for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 May 2021 07:18:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 1168 seconds by postgrey-1.36 at bendel; Tue, 11 May 2021 07:18:56 UTC
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A86D320288
	for <nbd@other.debian.org>; Tue, 11 May 2021 07:18:56 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FfTHm2ycRzklXc;
	Tue, 11 May 2021 14:57:08 +0800 (CST)
Received: from [10.174.178.31] (10.174.178.31) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 14:59:15 +0800
Subject: Re: [PATCH v6 0/2] fix a NULL pointer bug and simplify the code
To: Jens Axboe <axboe@kernel.dk>, <josef@toxicpanda.com>,
	<Markus.Elfring@web.de>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>
References: <20210218122620.228375-1-sunke32@huawei.com>
 <6df9a13d-b876-976f-ad48-884c88815269@kernel.dk>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <aa80f848-c895-4478-f582-10a57a1166c3@huawei.com>
Date: Tue, 11 May 2021 14:59:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <6df9a13d-b876-976f-ad48-884c88815269@kernel.dk>
Content-Type: multipart/alternative;
	boundary="------------11363906A229CB693433F311"
X-Originating-IP: [10.174.178.31]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4lpMQPyN7FH.A.vKF.pPjmgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1151
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aa80f848-c895-4478-f582-10a57a1166c3@huawei.com
Resent-Date: Tue, 11 May 2021 07:36:10 +0000 (UTC)

--------------11363906A229CB693433F311
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


在 2021/2/19 9:07, Jens Axboe 写道:
> On 2/18/21 5:26 AM, Sun Ke wrote:
>> fix a NULL pointer bug and simplify the code
>>
>> v6: Just add if (nbd->recv_workq) to nbd_disconnect_and_put().
>> v5: Adjust the title and add “Suggested-by”.
>> v4: Share exception handling code for if branches and
>> 	move put_nbd adjustment to a separate patch.
>> v3: Do not use unlock and add put_nbd.
>> v2: Use jump target unlock.
>>
>> Sun Ke (2):
>>    nbd: Fix NULL pointer in flush_workqueue
>>    nbd: share nbd_put and return by goto put_nbd
>>
>>   drivers/block/nbd.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
> Applied for 5.12, thanks.

Hi Jens,

I do not see the patches merged yet, is there anything wrong?

Thanks,
Sun Ke

>

--------------11363906A229CB693433F311
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2021/2/19 9:07, Jens Axboe 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6df9a13d-b876-976f-ad48-884c88815269@kernel.dk">
      <pre class="moz-quote-pre" wrap="">On 2/18/21 5:26 AM, Sun Ke wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">fix a NULL pointer bug and simplify the code

v6: Just add if (nbd-&gt;recv_workq) to nbd_disconnect_and_put().
v5: Adjust the title and add “Suggested-by”.
v4: Share exception handling code for if branches and 
	move put_nbd adjustment to a separate patch.
v3: Do not use unlock and add put_nbd.
v2: Use jump target unlock.

Sun Ke (2):
  nbd: Fix NULL pointer in flush_workqueue
  nbd: share nbd_put and return by goto put_nbd

 drivers/block/nbd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Applied for 5.12, thanks.</pre>
    </blockquote>
    <pre>Hi Jens,

I do not see the patches merged yet, is there anything wrong?

Thanks,
Sun Ke
</pre>
    <blockquote type="cite"
      cite="mid:6df9a13d-b876-976f-ad48-884c88815269@kernel.dk">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------11363906A229CB693433F311--

