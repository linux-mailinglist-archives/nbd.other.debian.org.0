Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YICxHeaOxWlG/QQAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Thu, 26 Mar 2026 20:54:14 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 204B433B27F
	for <lists+nbd@lfdr.de>; Thu, 26 Mar 2026 20:54:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BA22A206D7; Thu, 26 Mar 2026 19:54:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 26 19:54:13 2026
Old-Return-Path: <kuniyu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,
	RCVD_IN_DNSWL_NONE,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 79DEB20609
	for <lists-other-nbd@bendel.debian.org>; Thu, 26 Mar 2026 19:38:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.701 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_MED=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001,
	USER_IN_DEF_DKIM_WL=-7.5] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6xnIcpTzXDhI for <lists-other-nbd@bendel.debian.org>;
	Thu, 26 Mar 2026 19:38:50 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-dl1-x1229.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-dl1-x1229.google.com (mail-dl1-x1229.google.com [IPv6:2607:f8b0:4864:20::1229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 95282205F1
	for <nbd@other.debian.org>; Thu, 26 Mar 2026 19:38:47 +0000 (UTC)
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1273349c56bso1761944c88.0
        for <nbd@other.debian.org>; Thu, 26 Mar 2026 12:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774553924; cv=none;
        d=google.com; s=arc-20240605;
        b=eiz9txPegMkZibkkk3xhCntF06OJbhQAayG0HI8GEB+Swhc1IOj0a0fzWHAQk09Oqv
         PtdZkZEnTxp3XzNbwJvMNKSWGl+rt3ITS7Hzo8auh+B98G4zCpSLzJDlsjUVDtqbfBv5
         1K34/8CgEDJ723U+QYJmQFXH+M6nwoC0NSYZuRUdBWIsjLbFVCaovP5fxeqfbZefS1MU
         uhLtIGn+eODht0mI7W/s1m4jNyCuUcIkzvzXY0RifsXplZSCKAZgR0kisOgacE44TFaH
         bJ00x3jGZAvApjcfP36WEMtiFM7BnzkoFH+AQPrphYCs+Tpd9m0OguYldkOOUJ1UONol
         Ukbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6mCMJ7IYsFJz0Hh2fdQYOLxKjKcxltIu2zRqwDNj3FY=;
        fh=8Fg+c/g05zJTEeb5eeLUEml7uTBxONwgxm/UGd60D2w=;
        b=lJoYHdqg/QBo6PUDbXVle5rcu8Zgyg5KoS2MVZo9XI6ymXFxAWQBZT6KwqmmZjKi5I
         /3Vv9VY73HXiD4aOYUp2XVcGZhk1H8O5fraJLZUbZULM/O7cBPpS4twTeJLbYFWBuReu
         KmJMen6rbfTaewzAgscwOG4C4KI5gFhBIqtCLqwKUQtnmw+xeXTqwmBwVCZtDFpkmx9k
         yoV0dpounnyRL62VPsgfli0lqH3UDiB1qFA2rXiNZYa+2/46Zrag2U1RPQ2lI9k9D2dd
         v/2iZpPY24S5Ro2y4l0yCUq/qZLSMPHpAmGWeBCfiKfXxJ2Rm3Rl60cUiUOvk0UArWNV
         bkCw==;
        darn=other.debian.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774553924; x=1775158724; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mCMJ7IYsFJz0Hh2fdQYOLxKjKcxltIu2zRqwDNj3FY=;
        b=LOTuAd93bNqri3DDaP+PeDJXYz0QTkz/Rn3vh3onYgvWZL0Upw1qHHVfGyQ5BvILQM
         miKoczRcZ0jrSOpvQrJrok+6GYw7NYuacZhiB7JXFk8Zm2LxKxw45AhqKed5N7WAkYR6
         NZv9xZ01REKcCnwjgUaXj6/TqEXMkt5kOIOEu3apl3eDIciFnlfpwkqHKY1XEkxLhY1n
         kN+wTXEhTQSfWLD/0t4fH1upbFzyNrsPlKGOIkRNICqftvaDfu6erDw3nWgRi7GPkSnc
         dgdwlrAdinI5rPi+vXQblFZC6EgsnuwhpGOhuf4vIm8Hfnrj/I3KdL9u8HiqrfXo/wrw
         hRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774553924; x=1775158724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6mCMJ7IYsFJz0Hh2fdQYOLxKjKcxltIu2zRqwDNj3FY=;
        b=XGAfTEc5TzoYDElJiEjnbRb0MQXNGXlAEDb7r8dTpOLvTYpzxXQAofa5HiLT+hE64g
         MumymQG1toQSeK1jSvuqHR1HvnUuZSxs0R/jB0O/i/iPXAJ8K1MiAtpLfNEwvnIJW7u9
         +0AoZc+WlPc1FmKN4KjRKCSVrdudPEbExLwJagTxhSxkXXDXvWeJyAxebq/wOmDfwpVO
         0JSS7xDLQTgkQdNO+nOQHI0TZ9bYT5uKWjyPJerqURF/Youl5GsjFVvwFahQbaTXC/xM
         grGwxRbx3+yG1ZH9/VQHQW+vuXM8rqoNmhNQav73XWGKpuM4K/FUf8fggXgxHO3hUMqW
         ce3w==
X-Forwarded-Encrypted: i=1; AJvYcCXfX7s2UU4HgRXLORH7akoJoVrCSPaXCRM9V02j5sUygw5wnBgWGMPVpXbYCXtxsSHj9Pw=@other.debian.org
X-Gm-Message-State: AOJu0YzHNkiv69hIvrE/RKvIHUF82XRxJoyfh3rIANkndoBye2kyI0Tl
	3jy2kQeFiZI0jCWMgvUP/oQqSJFZEH+LC9tpVk3LfSO97qUGTsw4exxC9mjPA1RejSuweMoao6D
	3HZ5bz7OzFcZkxQZgIOXGdZK8BYgiqxgjmlijBxgt
X-Gm-Gg: ATEYQzyml9kF8aQ5bvyugmIRp5dCZ1swR+EcCZIdx0uxRqmEcIuouW1xMVpp+RwDBzy
	6ljUCV6mbqlez0MqkK4e4/RO3FTTl+oRz6Y4/hsCdmp6COiFHxxyI6Ml0eavxOU6Htm0cltu2Ru
	BJkbFNkCQO9MIm/4mobUZpcvI6FfTc4oX+M3UMIEdqjhenSZxah6yu6e7GOhkqbXzB55fb2Cd5/
	1ou3uMo2vrPemKama+MlcRmjkkbRHbvL4Z6z4eWse1g2rMOu1L4sVX0I8LcZNRRlEbLsnRRMATI
	8XYDV0q31HaNuTG5Y+6QNG2Klp+rR58GDiYG5Nm7nHQ0xPOnoZh8SZtU0uOUYqrBySYP/g==
X-Received: by 2002:a05:7022:ff45:b0:128:d51a:5157 with SMTP id
 a92af1059eb24-12a96f09443mr4300359c88.33.1774553923052; Thu, 26 Mar 2026
 12:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260325063843.1790782-6-kuniyu@google.com> <202603270301.kJulQgkT-lkp@intel.com>
In-Reply-To: <202603270301.kJulQgkT-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 26 Mar 2026 12:38:31 -0700
X-Gm-Features: AQROBzC56kOOvilMQ9x7JfCrqjezesmORZsrlXxqw-kdyJdYRmxiltxnB1IbvvY
Message-ID: <CAAVpQUBdco4wFmdVFdi4yQbH38fDCNLL-SUD=udBUy8uJ0spqQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] nbd: Use lock_sock_try() for TCP sendmsg() and shutdown().
To: kernel test robot <lkp@intel.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Simon Horman <horms@kernel.org>, 
	linux-block@vger.kernel.org, nbd@other.debian.org, netdev@vger.kernel.org, 
	syzbot+7b4f368d3955d2c9950e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <wMkg_DwjqTF.A.2HtJ.l7YxpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3531
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAAVpQUBdco4wFmdVFdi4yQbH38fDCNLL-SUD=udBUy8uJ0spqQ@mail.gmail.com
Resent-Date: Thu, 26 Mar 2026 19:54:13 +0000 (UTC)
X-Spamd-Result: default: False [-0.61 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.20)[generic];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lkp@intel.com,m:josef@toxicpanda.com,m:axboe@kernel.dk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:horms@kernel.org,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:netdev@vger.kernel.org,m:syzbot+7b4f368d3955d2c9950e@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[kuniyu@google.com,bounce-nbd=lists@other.debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[kuniyu@google.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[nbd,7b4f368d3955d2c9950e];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,mail.gmail.com:mid,bendel.debian.org:helo,bendel.debian.org:rdns]
X-Rspamd-Queue-Id: 204B433B27F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 12:14=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Kuniyuki,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on axboe/for-next]
> [also build test ERROR on linus/master v7.0-rc5]
> [cannot apply to next-20260325]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/=
nbd-Remove-redundant-sock-ops-shutdown-check-in-nbd_get_socket/20260325-175=
457
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git f=
or-next
> patch link:    https://lore.kernel.org/r/20260325063843.1790782-6-kuniyu%=
40google.com
> patch subject: [PATCH 5/5] nbd: Use lock_sock_try() for TCP sendmsg() and=
 shutdown().
> config: x86_64-buildonly-randconfig-004-20260326 (https://download.01.org=
/0day-ci/archive/20260327/202603270301.kJulQgkT-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260327/202603270301.kJulQgkT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603270301.kJulQgkT-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: inet_shutdown_locked
>    >>> referenced by nbd.c
>    >>>               drivers/block/nbd.o:(nbd_mark_nsock_dead) in archive=
 vmlinux.a
> --
> >> ld.lld: error: undefined symbol: tcp_sendmsg_locked
>    >>> referenced by nbd.c
>    >>>               drivers/block/nbd.o:(__sock_xmit) in archive vmlinux=
.a

ah, CONFIG_INET=3Dn.  Will fix it in v2.

Thanks

