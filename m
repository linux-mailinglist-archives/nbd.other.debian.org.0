Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 11179403E3A
	for <lists+nbd@lfdr.de>; Wed,  8 Sep 2021 19:15:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A172E207D4; Wed,  8 Sep 2021 17:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  8 17:15:10 2021
Old-Return-Path: <nathan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8892B207BB
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Sep 2021 16:57:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.827 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1,
	DKIMWL_WL_HIGH=-0.747, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GZ7yqAMhwDys for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Sep 2021 16:57:05 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6ABA9207B8
	for <nbd@other.debian.org>; Wed,  8 Sep 2021 16:57:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67C8B61100;
	Wed,  8 Sep 2021 16:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631120218;
	bh=PqcBl1KQZaLj2UYPjvgmgug1mUEXiPMNAK6+xOcOsHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mbVliIBERcN/usqu1zlgBACEyAyoxT96QZVlh+NQ4n+dZT9LU53SPEyDE4/PZaiPs
	 ISkbyKheF5/z3ylZtrBXdmRDKmC68UVoa85j4A+Z8PkHr+LwNH1u2JBeyGHhw6Z3OZ
	 gq2bsdUdxPDGB4n8WVNVGoYvHHgCZRd6wKPDiOUnX8ZM/pA7FmaAUb+jyy1RJaJ7ZI
	 2s1WadrJOT4gtCdepAKPlewRE7CWbaLEP+DqCRSTAofjuNfBYafdHPKkpsBglRgCfl
	 uYSj0ettDYJZFkWs001XHq/zhCg80vyn5Y+Q1hYJ5IKf7U3+qkdPdLB2eaI7cSxKiN
	 GGEKX+Xs2mhOg==
Date: Wed, 8 Sep 2021 09:56:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: linux-block <linux-block@vger.kernel.org>, nbd@other.debian.org,
	open list <linux-kernel@vger.kernel.org>,
	clang-built-linux <clang-built-linux@googlegroups.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	lkft-triage@lists.linaro.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev
Subject: Re: ERROR: modpost: __mulodi4 [drivers/block/nbd.ko] undefined!
Message-ID: <YTjrVWaTIA5ZZumW@archlinux-ax161>
References: <CA+G9fYvThAuTu1-Tg+7BaFofxfBkvBuTAnycuws-U4p473MeZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvThAuTu1-Tg+7BaFofxfBkvBuTAnycuws-U4p473MeZQ@mail.gmail.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ImO0UdYIV1.A.thC.e-OOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1419
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YTjrVWaTIA5ZZumW@archlinux-ax161
Resent-Date: Wed,  8 Sep 2021 17:15:10 +0000 (UTC)

Hi Naresh,

On Wed, Sep 08, 2021 at 04:58:11PM +0530, Naresh Kamboju wrote:
> Following build warnings/ errors noticed while building linux next
> master branch with clang-13 for arm architecture with following configs.
>   - footbridge_defconfig
>   - mini2440_defconfig
>   - s3c2410_defconfig
> 
> ERROR: modpost: __mulodi4 [drivers/block/nbd.ko] undefined!
> make[2]: *** [/builds/linux/scripts/Makefile.modpost:134:
> modules-only.symvers] Error 1
> make[2]: *** Deleting file 'modules-only.symvers'
> make[2]: Target '__modpost' not remade because of errors.
> make[1]: *** [/builds/linux/Makefile:1952: modules] Error 2
> make[1]: Target '__all' not remade because of errors.
> make: *** [Makefile:226: __sub-make] Error 2
> make: Target '__all' not remade because of errors.

Thanks for the report. This is a known issue that we have been tracking
and it is now resolved in LLVM 14:

https://github.com/ClangBuiltLinux/linux/issues/1438

Nick said he should have a kernel patch to work around this in the
kernel for older versions of LLVM soon.

By the way, can you use our new mailing list and my kernel.org address
for future reports (llvm@lists.linux.devi, nathan@kernel.org)? It will
make it easier to find these reports in the archives in the future and
my filters will catch this better.

Cheers,
Nathan

