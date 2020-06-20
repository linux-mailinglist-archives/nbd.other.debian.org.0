Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD5620237F
	for <lists+nbd@lfdr.de>; Sat, 20 Jun 2020 14:06:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8F11F20418; Sat, 20 Jun 2020 12:06:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jun 20 12:06:34 2020
Old-Return-Path: <Markus.Elfring@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	LDOSUBSCRIBER,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D28132027A
	for <lists-other-nbd@bendel.debian.org>; Sat, 20 Jun 2020 12:06:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.123 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3JFyZ8pX7P7S for <lists-other-nbd@bendel.debian.org>;
	Sat, 20 Jun 2020 12:06:22 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .web. - helo: .mout.web. - helo-domain: .web.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 77F5620204
	for <nbd@other.debian.org>; Sat, 20 Jun 2020 12:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1592654756;
	bh=42kox52x5HpeaYmlS8iN/4a3O5nbkPDAEP7S2unRXk0=;
	h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
	b=PSMdyJdiPSNfETdpp0pchjC8ho/A2mDDmrynvsKLDlYdU2vdAQP/JqUunJm57Fusc
	 A3EqqVFEJR6MiYjmP81EKsAAaFOOmGm+DMNTf1qvK8zjW7RO4sApwg2Haq1itshsOA
	 1R+6e9fRxos4TBXh/Iwn7LX95Y7iLBqBZQjR/CV8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.139.185]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LpQjF-1jGI7724lp-00f8bk; Sat, 20
 Jun 2020 14:05:56 +0200
To: Zheng Bin <zhengbin13@huawei.com>, linux-block@vger.kernel.org
Cc: nbd@other.debian.org, Navid Emamdoost <navid.emamdoost@gmail.com>,
 Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
 Stephen McCamant <mccamant@cs.umn.edu>, Qiushi Wu <wu000273@umn.edu>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Yi Zhang <yi.zhang@huawei.com>
Subject: Re: [PATCH v2] nbd: Fix memory leak in nbd_add_socket
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <b55f8af2-b20c-214f-90f0-9b6efcb7273c@web.de>
Date: Sat, 20 Jun 2020 14:05:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fx4SRyXo0jNr5mPJylsMhZlfteu2CS304HYyK3aGfdL2nAhOOjd
 yE5x41KuAhq5SF9sIsrNOtbWuKG1BsIkG79e6LeM72s/gFk6bIBNBZ7G0dIhh++jOih2seU
 /RBx3U0LOrLoHdw/0NtM3WUcgJflhbDlQtcjCDxcDJydEUv9yz+fzEB7URgaJyx64p71xvg
 MvjIlyaoxEoxP8e8paWjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AJbsK0XqvpM=:nVOkrWqzJ9B0Waj5yxBjBF
 UfQJNSKo7nIf0S3OfOJyLw8d9T8lKI6gq2lEbyHBzdgWEjdhiGnnewBtZjPjtpXUAHYNTWlvU
 Rb1t+dgbtp+MAipRuuJLCZ56cTgVkiRPG4+EYKw6NYu1Y14KRw/X5kQocOds4jovJVjFyC+uq
 tmlzZ4evfq4EMHn4Vcr9EKRfDe44oeMz2hpr224UvaftvjLHAM+AdA8DE2L92Xf7ebl2e8HuF
 oV4B5h/bhLIanTMSdJp6DBS1GImXqiTlxTDvt/2lrrqv+bdBiMjo/4WBAbE5b6jL5Ru2nu3x/
 fR6eWAF/hEO43fz6BPwFAJY3yYZKhzI6c9pXbUmJHfo4es0xP+FZSEVrTDA9TnldUkRwrT3yj
 4UZeV3ZoYvv/yfaPzapJbeK8r1zW5XErRbf7OazbfE3y14q+5L2vSPJU5ato3cY9dX0Nf7IpF
 ViokwvAhr1X5AcsBSsriqscwbhfrdpDOfFJSWxbI+PMqsBcdl37j20o4eozIcXlyZkmJmdrgj
 r0YmJ/r/pY4l9wv7/JnubBkgYUlJfrPysUDbYsIgsSmalOXlng7d8Nq1FLosojQhNRV8OPD/0
 cQPXrtX6dkpXjH3SYQbJQHBgyOkOHa4+zsOuXkfeBvTxZRB6F/b4tXPLlEecaAwN3t027CDdY
 DXyybiqlghL0vgpiIwkPpfnYvNtcWEMuWIvrF1FZCjQ12asKSdib+zQ7MN50v3o2Tyxu9bJ95
 wq4AJ+4imyBSrmTtSWo2HrsKVxOBCzivt1E2kuzChFskpESbTFUaeDd1csLamGW8hBqbULBVm
 ckwoZqxlSwD0Gj8ucJsrZoi1jc8Ud14hUtiVM4zeJO1PbAO2VlHvOIvg8rFK0RNkcSFI8mvPH
 OrxKBVRtRm6lnIcma1wKvQc+fm2CqupBxI/OYWZkfxV00UCtmKGIqhtysgo8IaRS6QXLYexhs
 WKY/umZKPa4CIvGQscQywds4TggE45k89qE5ES4+uUBa2ZhT24VlhMYWIuPFy6XrgQabMX9rY
 K8hhleekQgxgwj7d4UKZBNCPd795w7u6mwg+c9HlfBMvTQHixqhmnXPXvRmFMMCeA+jRypKeR
 4fQXbL+p1RwJs1FELwwAEFOJD2/U7Zs+k7t3d8+YRXj3t6AGR+sjTRwVBe2XIIwElWcc7aQfg
 jUDDVY9IizI6KoFHZ7lw66/rD+YcxraQuFHEv21M6oBWzcxJhojAJwty3l/mIlR1g8SsTPaJk
 7kWz7g8VJE8YYaANi
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ilEAnKbteH.A.Z3D.Kvf7eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/904
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b55f8af2-b20c-214f-90f0-9b6efcb7273c@web.de
Resent-Date: Sat, 20 Jun 2020 12:06:34 +0000 (UTC)

> If we add first socket to nbd, config->socks is malloced but
> num_connections does not update(nsock's allocation fail), the memory
> is leaked. Cause in later nbd_config_put(), will only free config->socks
> when num_connections is not 0.
>
> Let nsock's allocation first to avoid this.

I suggest to improve this change description.
Can an other wording variant be nicer?


=E2=80=A6
> +++ b/drivers/block/nbd.c
> @@ -1037,21 +1037,22 @@  static int nbd_add_socket(struct nbd_device *nb=
d, unsigned long arg,
>  		return -EBUSY;
>  	}
>
> +	nsock =3D kzalloc(sizeof(struct nbd_sock), GFP_KERNEL);

Please use the following code variant.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?id=3D4333a9b0b67bb4e8bcd91bdd80da80b0=
ec151162#n854

+	nsock =3D kzalloc(sizeof(*nsock), GFP_KERNEL);


=E2=80=A6
>  	if (!socks) {
>  		sockfd_put(sock);
> +		kfree(nsock);
>  		return -ENOMEM;
>  	}

Please take another software design possibility into account.

 	if (!socks) {
-		sockfd_put(sock);
-		return -ENOMEM;
+		kfree(nsock);
+		goto put_socket;
 	}


Regards,
Markus

