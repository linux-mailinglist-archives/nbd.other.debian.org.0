Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4CD37B4AD
	for <lists+nbd@lfdr.de>; Wed, 12 May 2021 05:48:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2448220309; Wed, 12 May 2021 03:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 12 03:48:09 2021
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=FOURLA,HTML_MESSAGE,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4216520309
	for <lists-other-nbd@bendel.debian.org>; Wed, 12 May 2021 03:30:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, HTML_MESSAGE=2,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nvyJSp2ivPOP for <lists-other-nbd@bendel.debian.org>;
	Wed, 12 May 2021 03:30:02 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga04-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C3B4520301
	for <nbd@other.debian.org>; Wed, 12 May 2021 03:29:59 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fg0ZH39nlzmg8s;
	Wed, 12 May 2021 11:26:31 +0800 (CST)
Received: from [10.174.178.31] (10.174.178.31) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 12 May 2021 11:29:52 +0800
Subject: Re: [PATCH v6 0/2] fix a NULL pointer bug and simplify the code
To: Jens Axboe <axboe@kernel.dk>, <josef@toxicpanda.com>,
	<Markus.Elfring@web.de>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>
References: <20210218122620.228375-1-sunke32@huawei.com>
 <6df9a13d-b876-976f-ad48-884c88815269@kernel.dk>
 <aa80f848-c895-4478-f582-10a57a1166c3@huawei.com>
 <6ab031d5-f836-77c9-8be0-7b3e82a087a8@kernel.dk>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <5e6a03ae-c7b8-b6bd-b506-490a80c1cbd1@huawei.com>
Date: Wed, 12 May 2021 11:29:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <6ab031d5-f836-77c9-8be0-7b3e82a087a8@kernel.dk>
Content-Type: multipart/alternative;
	boundary="------------C77E1605FA8BD0E7A850B6B9"
X-Originating-IP: [10.174.178.31]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <77VUC6EJ4EF.A.8IB.5_0mgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1153
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5e6a03ae-c7b8-b6bd-b506-490a80c1cbd1@huawei.com
Resent-Date: Wed, 12 May 2021 03:48:09 +0000 (UTC)

--------------C77E1605FA8BD0E7A850B6B9
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

在 2021/5/11 21:48, Jens Axboe 写道:
> On 5/11/21 12:59 AM, Sun Ke wrote:
>> 在 2021/2/19 9:07, Jens Axboe 写道:
>>> On 2/18/21 5:26 AM, Sun Ke wrote:
>>>> fix a NULL pointer bug and simplify the code
>>>>
>>>> v6: Just add if (nbd->recv_workq) to nbd_disconnect_and_put().
>>>> v5: Adjust the title and add “Suggested-by”.
>>>> v4: Share exception handling code for if branches and
>>>> 	move put_nbd adjustment to a separate patch.
>>>> v3: Do not use unlock and add put_nbd.
>>>> v2: Use jump target unlock.
>>>>
>>>> Sun Ke (2):
>>>>    nbd: Fix NULL pointer in flush_workqueue
>>>>    nbd: share nbd_put and return by goto put_nbd
>>>>
>>>>   drivers/block/nbd.c | 10 +++++-----
>>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>> Applied for 5.12, thanks.
>> Hi Jens,
>>
>> I do not see the patches merged yet, is there anything wrong?
> Huh, that's very strange. Not sure what happened here, care to
> resend them?
OK, I will resend them.
>

--------------C77E1605FA8BD0E7A850B6B9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">在 2021/5/11 21:48, Jens Axboe 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6ab031d5-f836-77c9-8be0-7b3e82a087a8@kernel.dk">
      <pre class="moz-quote-pre" wrap="">On 5/11/21 12:59 AM, Sun Ke wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
在 2021/2/19 9:07, Jens Axboe 写道:
</pre>
        <blockquote type="cite">
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
          <pre class="moz-quote-pre" wrap="">Applied for 5.12, thanks.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hi Jens,

I do not see the patches merged yet, is there anything wrong?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Huh, that's very strange. Not sure what happened here, care to
resend them?</pre>
    </blockquote>
    <font face="monospace">OK, I will resend them.</font><br>
    <blockquote type="cite"
      cite="mid:6ab031d5-f836-77c9-8be0-7b3e82a087a8@kernel.dk">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------C77E1605FA8BD0E7A850B6B9--

